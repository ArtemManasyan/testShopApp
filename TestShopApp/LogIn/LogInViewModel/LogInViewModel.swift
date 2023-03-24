//
//  LogInViewModel.swift
//  TestShopApp
//
//  Created by Артем Манасян on 11.03.2023.
//

import Foundation


class LogInViewModel {
    weak var loginVC: LogInViewController?
    
    
    func test() {
        let model = LogInModel {
            self.loginVC?.logInTap()
        }
        
    }
    
    
    
    func viewDidLoad() {
        test()
    }
}
