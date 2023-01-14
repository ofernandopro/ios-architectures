//
//  RegisterViewController.swift
//  iOSArchitectures
//
//  Created by Fernando Moreira on 14/01/23.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBAction func actionRegisterButton(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text,
           let confirmPassword = confirmPasswordTextField.text {
            
            if password != confirmPassword {
                showMessage(title: "Erro", message: "Senhas não conferem!")
                return
            }
            
            let manager = UserManager(business: UserBusiness())
            manager.register(email: email,
                             password: password) { userModel in
                
                self.openHomeVC()
                
            } failureHandler: { error in
                self.showMessage(title: "Erro", message: error.localizedDescription)
            }

        }
    }
    
    @IBAction func actionLoginButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func openHomeVC() {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: true)
    }

    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
}
