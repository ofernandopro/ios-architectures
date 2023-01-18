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
        
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
}
