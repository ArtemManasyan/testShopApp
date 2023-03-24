//
//  LogInViewController.swift
//  TestShopApp
//
//  Created by Артем Манасян on 11.03.2023.
//

import UIKit

class LogInViewController: UIViewController {
    let logInViewModel = LogInViewModel()
    let logInTitle = UILabel()
    let firstNameTF = LogInTextField()
    let passwordTF = LogInTextField()
    let loginButton = UIButton()
    var text = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#FAF9FF")
        setSubviews()
        logInViewModel.loginVC = self
        logInViewModel.viewDidLoad()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        logInTitle.pin.top(158).hCenter().height(25).sizeToFit()
        firstNameTF.pin.below(of: logInTitle).marginTop(77).height(29).horizontally(43)
        passwordTF.pin.below(of: firstNameTF).marginTop(35).height(29).horizontally(43)
        loginButton.pin.below(of: passwordTF).marginTop(99).height(46).horizontally(43)

    }
        
    func setSubviews() {
        view.addSubviews([logInTitle, firstNameTF, passwordTF, loginButton])
        logInTitle.text = "Welcome back"
        logInTitle.textColor = .black
        logInTitle.font = UIFont(name: "Montserrat-SemiBold", size: 25)
        
        firstNameTF.attributePlaceholder()
        firstNameTF.textField.placeholder = "First name"
        
        passwordTF.attributePlaceholder()
        passwordTF.textField.isSecureTextEntry = true
        passwordTF.addIconToTextField(imageName: "hideText")
        passwordTF.textField.placeholder = "Password"
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = 15
        loginButton.backgroundColor = UIColor(hex: "#4E55D7")
        loginButton.addTarget(self, action: #selector(logInTap), for: .touchUpInside)
        
    }

    @objc func logInTap() {
        if let loginText = firstNameTF.textField.text {
            text = loginText; if !text.isEmpty {
                let mainTabBarVC = MainTabBarViewController()
                mainTabBarVC.modalPresentationStyle = .fullScreen
                self.dismiss(animated: true)
                self.show(mainTabBarVC, sender: nil)
            }
        }
    }

}
