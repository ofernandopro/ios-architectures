//
//  LoginView.swift
//  iOSArchitectures
//
//  Created by Fernando Moreira on 17/01/23.
//

import UIKit

class LoginView: UIView {
    
    // MARK: - Closures
    var onRegisterTap:(() -> Void)?
    var onLoginTap:((_ email: String, _ password: String) -> Void)?
    
    // MARK: - Properties
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 5
        tf.layer.borderColor = UIColor.black.cgColor
        tf.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
        tf.textColor = .black
        tf.placeholder = "Type your email..."
        tf.keyboardType = .emailAddress
        tf.setLeftPaddingPoints(15)
        return tf
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 5
        tf.layer.borderColor = UIColor.black.cgColor
        tf.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
        tf.textColor = .black
        tf.placeholder = "Type your password..."
        tf.isSecureTextEntry = true
        tf.keyboardType = .emailAddress
        tf.setLeftPaddingPoints(15)
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Login", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
        return btn
    }()
    
    lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Register", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(registerButtonTap), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .viewBackgroundColor
        
        configConstraints()
    }
    
    // MARK: - Actions
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    func configConstraints() {
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
        
            emailLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 60),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),

            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 40),
            registerButton.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    // MARK: - Actions
    @objc func registerButtonTap() {
        self.onRegisterTap?()
    }
    
    @objc func loginButtonTap() {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            self.onLoginTap?(email, password)
        } else {
            
        }
        
    }

}
