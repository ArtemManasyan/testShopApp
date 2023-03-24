//
//  ViewController.swift
//  TestShopApp
//
//  Created by Артем Манасян on 11.03.2023.
//

import UIKit

class SignInViewController: UIViewController {
    let signInViewModel = SignInViewModel()
    let logInVc = LogInViewController()
    let signInView = SignInView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#FAF9FF")
        view.addSubview(signInView)
        signInViewModel.vc = self
        signInViewModel.viewDidLoad()
    }
    
    func getModel(model: SignInModel) {
        signInView.setSubviews(model: model)
    }
    
    func logInPressed(button: UIButton) {
        signInViewModel.configModel()
        self.view.addSubview(logInVc.view)
        self.addChild(logInVc)
        logInVc.didMove(toParent: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInView.pin.all()
        
    }
    

    

}




