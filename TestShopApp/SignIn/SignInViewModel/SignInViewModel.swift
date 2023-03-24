//
//  SignInViemModel.swift
//  TestShopApp
//
//  Created by Артем Манасян on 11.03.2023.
//

import Foundation

class SignInViewModel {
    
    weak var vc: SignInViewController?
    var logInPressed: (() -> Void)?
    
    func configModel() {
        let signInModel = SignInModel(firstName: "", lastName: "", email: "") { [weak self] button in
            self?.vc?.logInPressed(button: button)
        }
        
        self.vc?.getModel(model: signInModel)
    }
    
    func viewDidLoad() {
        configModel()
    }
    
}
