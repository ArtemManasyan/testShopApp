//
//  LogInTextField.swift
//  TestShopApp
//
//  Created by Артем Манасян on 13.03.2023.
//

import UIKit

class LogInTextField: UIView {
    
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
    
    func addIconToTextField(imageName: String) {
        let imageView = UIImageView(frame: CGRect(x: -6, y: 2, width: 15, height: 15))
        imageView.image = UIImage(named: imageName)
        
        let imageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageContainerView.addSubview(imageView)
        textField.rightView = imageContainerView
        textField.rightViewMode = .always
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textField.layer.cornerRadius = textField.frame.height / 2
        textField.pin.horizontally().height(29)
        
        
    }
}
