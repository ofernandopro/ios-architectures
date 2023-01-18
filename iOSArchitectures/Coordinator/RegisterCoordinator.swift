//
//  RegisterCoordinator.swift
//  iOSArchitectures
//
//  Created by Fernando Moreira on 18/01/23.
//

import UIKit

class RegisterCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    func start() {
        let vc = RegisterViewController()
        
        vc.onRegisterSuccess = {
            let coordinator = HomeCoordinator(navigationController: self.navigationController)
            coordinator.start()
        }
        
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
