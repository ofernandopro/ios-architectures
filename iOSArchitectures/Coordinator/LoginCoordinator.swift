//
//  LoginCoordinator.swift
//  iOSArchitectures
//
//  Created by Fernando Moreira on 17/01/23.
//

import UIKit

class LoginCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    func start() {
        let vc = LoginViewController()
        
        vc.onRegisterTap = {
            let coordinator = RegisterCoordinator(navigationController: self.navigationController)
            coordinator.start()
        }
        
        vc.onLoginSuccess = {
            let coordinator = HomeCoordinator(navigationController: self.navigationController)
            coordinator.start()
        }
        
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}










