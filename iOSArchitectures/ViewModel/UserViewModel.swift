//
//  UserViewModel.swift
//  iOSArchitectures
//
//  Created by Fernando Moreira on 18/01/23.
//

import UIKit

class UserViewModel {

    private let model: UserModel
    
    init(model: UserModel) {
        self.model = model
    }
    
    init() {
        self.model = UserModel()
    }
    
    var email: String {
        model.email
    }
    
    func getUserFromAPI(_ email: String, _ password: String, completion: @escaping(Result<UserViewModel, Error>) -> Void) {
        let manager = UserManager(business: UserBusiness())
        manager.login(email: email, password: password) { userModel in
            
            completion(.success(UserViewModel(model: userModel)))
            
        } failureHandler: { error in
            
            completion(.failure(error))
            
        }
    }
    
    func setUserFromAPI(_ email: String, _ password: String, completion: @escaping(Result<UserViewModel, Error>) -> Void) {
        let manager = UserManager(business: UserBusiness())
        manager.register(email: email, password: password) { userModel in
            
            completion(.success(UserViewModel(model: userModel)))
            
        } failureHandler: { error in
            
            completion(.failure(error))
            
        }
    }
    
}
