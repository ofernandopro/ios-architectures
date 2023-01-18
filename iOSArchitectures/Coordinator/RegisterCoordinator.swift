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
        let viewController = RegisterViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
