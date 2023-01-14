//
//  LoginViewController.swift
//  iOSArchitectures
//
//  Created by Fernando Moreira on 13/01/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBAction func actionLoginButton(_ sender: Any) {
        let manager = UserManager(business: UserBusiness())
        
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            
            manager.login(email: email, password: password) { userModel in
                self.openHomeVC()
            } failureHandler: { error in
                self.showMessage(title: "Erro", message: error.localizedDescription)
            }
            
        }

    }
    
    @IBAction func actionRegisterButton(_ sender: Any) {
        let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        registerVC.modalPresentationStyle = .fullScreen
        self.present(registerVC, animated: true)
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func openHomeVC() {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: true)
    }

}
