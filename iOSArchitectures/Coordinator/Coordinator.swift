//
//  Coordinator.swift
//  iOSArchitectures
//
//  Created by Fernando Moreira on 17/01/23.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
    init(navigationController: UINavigationController)
}














