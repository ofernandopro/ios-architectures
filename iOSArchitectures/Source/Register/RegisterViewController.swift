//
//  RegisterViewController.swift
//  iOSArchitectures
//
//  Created by Fernando Moreira on 14/01/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let presenter: RegisterPresenter = RegisterPresenter()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBAction func actionRegisterButton(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text,
           password == confirmPasswordTextField.text {
            
            let userModel = UserModel(email: email, password: password)
            presenter.register(userModel: userModel)
            
        } else {
            showMessage(title: "Erro", message: "Senhas não conferem ou campo vazio")
        }
       
        
    }
    
    @IBAction func actionLoginButton(_ sender: Any) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.delegate = self
    }

}

extension RegisterViewController: RegisterPresenterDelegate {
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
    
    func goHome() {
        let home = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        home.modalPresentationStyle = .fullScreen
        present(home, animated: true)
    }
    
    
}
