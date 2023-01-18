//
//  HomeView.swift
//  iOSArchitectures
//
//  Created by Fernando Moreira on 18/01/23.
//

import UIKit

class HomeView: UIView {

    lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome to Home!"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        self.addSubview(helloLabel)
        
        NSLayoutConstraint.activate([
        
            helloLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            helloLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            helloLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
        ])
    }
    
}
