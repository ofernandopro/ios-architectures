//
//  RegisterViewController.swift
//  iOSArchitectures
//
//  Created by Fernando Moreira on 18/01/23.
//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: - Closure
    var onRegisterSuccess:(() -> Void)?
    
    // MARK: - Properties
    lazy var registerView: RegisterView = {
        let view = RegisterView(frame: .zero)
        
        view.onRegisterTap = { [weak self] email, password in
            self?.registerTap(email, password)
        }
        
        return view
    }()
    
    // MARK: - Override
    
    override func loadView() {
        super.loadView()
        self.view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Create your Account"
    }
    
    // MARK: - Actions
    
    private func registerTap(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        userViewModel.setUserFromAPI(email, password) { [weak self] result in
            switch result {
            case .success(_):
                self?.onRegisterSuccess?()
            case .failure(let error):
                self?.showMessage("Erro", error.localizedDescription)
            }
        }

    }
    
    func showMessage(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

}
