//
//  HomeViewController.swift
//  iOSArchitectures
//
//  Created by Fernando Moreira on 18/01/23.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties
    lazy var homeView: HomeView = {
        let view = HomeView(frame: .zero)
        
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemGray
    }

}
