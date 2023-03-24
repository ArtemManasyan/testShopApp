//
//  SignInMainModel.swift
//  TestShopApp
//
//  Created by Артем Манасян on 11.03.2023.
//

import Foundation
import UIKit


class SignInView: UIView {
    
    var model: SignInModel?
    let signInTitle = UILabel()
    let firstNameTF = SignInTextField()
    let lastNameTF = SignInTextField()
    let emailTF = SignInTextField()
    let signInButton = UIButton()
    let haveAccountLabel = UILabel()
    let logInButton = UIButton()
    let googleIcon = UIImageView()
    let appleIcon =  UIImageView()
    let signInGoogleButton = UIButton()
    let signInAppleButton = UIButton()
    
    func setSubviews(model: SignInModel) {
        self.model = model
        addSubviews([signInTitle, firstNameTF, lastNameTF, emailTF, signInButton, logInButton, haveAccountLabel, googleIcon, signInGoogleButton, appleIcon, signInAppleButton])
    
        signInTitle.text = "Sign in"
        signInTitle.font = UIFont(name: "Montserrat-SemiBold", size: 25)
        signInTitle.textColor = .black
        
        firstNameTF.attributePlaceholder()
        firstNameTF.textField.placeholder = "First name"
        
        lastNameTF.attributePlaceholder()
        lastNameTF.textField.placeholder = "Last name"
        emailTF.attributePlaceholder()
        emailTF.textField.placeholder = "Email"
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.backgroundColor = UIColor(hex: "#4E55D7")
        signInButton.layer.cornerRadius = 15
        
        haveAccountLabel.text = "Already have an account?"
        haveAccountLabel.textColor = .gray
        haveAccountLabel.font = UIFont(name: "Montserrat-Medium", size: 9)
        logInButton.setTitle("Log in", for: .normal)
        logInButton.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 10)
        logInButton.setTitleColor(UIColor(hex: "#4E55D7"), for: .normal)
        logInButton.addTarget(self, action: #selector(logInTapped), for: .touchUpInside)
        signInGoogleButton.setTitle("Sign in with Google", for: .normal)
        signInGoogleButton.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 10)
        signInGoogleButton.setTitleColor(.black, for: .normal)
        googleIcon.image = UIImage(named: "google")
        signInAppleButton.setTitle("Sign in with Apple", for: .normal)
        signInAppleButton.setTitleColor(.black, for: .normal)
        signInAppleButton.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 10)
        appleIcon.image = UIImage(named: "apple")
      
    }
    
    @objc func logInTapped() {
        model?.logInTap(logInButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        signInTitle.pin.top(142).hCenter().height(25).sizeToFit()
        firstNameTF.pin.below(of: signInTitle).marginTop(77).height(29).horizontally(43)
        lastNameTF.pin.below(of: firstNameTF).marginTop(35).height(29).horizontally(43)
        emailTF.pin.below(of: lastNameTF).marginTop(35).height(29).horizontally(43)
        signInButton.pin.below(of: emailTF).marginTop(35).height(46).horizontally(43)
        haveAccountLabel.pin.below(of: signInButton,aligned: .left).marginTop(17).sizeToFit()
        logInButton.pin.after(of: haveAccountLabel, aligned: .center).marginLeft(8).height(11).sizeToFit()
        signInGoogleButton.pin.below(of: logInButton).marginTop(83).height(12).hCenter().sizeToFit()
        googleIcon.pin.before(of: signInGoogleButton, aligned: .center).marginRight(12).sizeToFit()
        signInAppleButton.pin.below(of: signInGoogleButton,aligned: .left).marginTop(48).height(12).sizeToFit()
        appleIcon.pin.below(of: googleIcon, aligned: .center).marginTop(48).sizeToFit()
    }
}

struct SignInModel {
    
    let firstName: String?
    let lastName: String?
    let email: String?
    let logInTap: ((UIButton) -> Void)
}
