//
//  MyTextField.swift
//  TestShopApp
//
//  Created by Артем Манасян on 12.03.2023.
//

import UIKit

class SignInTextField: UIView {
    
    lazy var textField: UITextField = {
        let tf = UITextField()
        self.addSubview(tf)
        tf.backgroundColor = UIColor(hex: "#E8E8E8")
        return tf
    }()
    
    func attributePlaceholder() {
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        textField.attributedPlaceholder = NSAttributedString(
            string: "Placeholder",
            attributes: [.paragraphStyle: centeredParagraphStyle])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textField.layer.cornerRadius = textField.frame.height / 2
        textField.pin.horizontally().height(29)
        
    }
}
