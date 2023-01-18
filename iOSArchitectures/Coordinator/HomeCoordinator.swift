//
//  HomeCoordinator.swift
//  iOSArchitectures
//
//  Created by Fernando Moreira on 18/01/23.
//

import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    func start() {
        let vc = HomeViewController()
        //self.navigationController.pushViewController(vc, animated: true)
        vc.modalPresentationStyle = .fullScreen
        self.navigationController.present(vc, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
}
