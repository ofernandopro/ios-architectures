//
//  LoginViewController.swift
//  iOSArchitectures
//
//  Created by Fernando Moreira on 17/01/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Closures
    var onRegisterTap:(() -> Void)?
    var onLoginSuccess:(() -> Void)?
    
    // MARK: - Properties
    
    lazy var loginView: LoginView = {
        let view = LoginView(frame: .zero)
        
        view.onRegisterTap = { [weak self] in
            self?.onRegisterTap?()
        }
        
        view.onLoginTap = { [weak self] email, password in
            self?.onLoginTap(email, password)
        }
        
        
        return view
    }()
    
    // MARK: - Overrides
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Login"
        //self.view.backgroundColor = .viewBackgroundColor
    }
    
    private func openTap(_ email: String, _ password: String) {
        let manager = UserManager(business: UserBusiness())
        manager.login(email: email, password: password) { [weak self] userModel in
            
            self?.onLoginSuccess?()
            
        } failureHandler: { [weak self] error in
            self?.showMessage("Erro", error.localizedDescription)
        }

    }
    
    func showMessage(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
