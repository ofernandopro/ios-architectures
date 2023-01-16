//
//  LoginViewController.swift
//  iOSArchitectures
//
//  Created by Fernando Moreira on 14/01/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    let presenter: LoginPresenter = LoginPresenter()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func actionLoginButton(_ sender: Any) {
        
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            let userModel = UserModel(email: email,
                                      password: password)
            presenter.login(userModel: userModel)
        }
        
    }
    
    @IBAction func actionRegisterButton(_ sender: Any) {
        
        let register = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        register.modalPresentationStyle = .fullScreen
        self.present(register, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.delegate = self
    }

}

extension LoginViewController: LoginPresenterDelegate {
    
    func goHome() {
        let home = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        home.modalPresentationStyle = .fullScreen
        self.present(home, animated: true)
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
}






