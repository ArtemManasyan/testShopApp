//
//  GeneralViews.swift
//  TestShopApp
//
//  Created by Артем Манасян on 14.03.2023.
//

import UIKit

class CategoryViewLabel: UIView {
    let paddingView = UIView()
    let categoryLabel = UILabel()
    
    func set() {
        addSubviews([paddingView, categoryLabel])
        categoryLabel.font = UIFont(name: "Montserrat-SemiBold", size: 10)
        paddingView.backgroundColor = UIColor(hex: "#C4C4C4D9")
        
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        paddingView.pin.all()
        categoryLabel.pin.hCenter().vCenter().sizeToFit()
    }
}

class FlashDiscountViewLabel: UIView {
    let padding = UIView()
    let discountLabel = UILabel()
    
    func set() {
        addSubviews([padding, discountLabel])
        discountLabel.font = UIFont(name: "Montserrat-SemiBold", size: 10)
        padding.backgroundColor = UIColor(hex: "#F93A3A")
        padding.layer.cornerRadius = padding.frame.height / 2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        padding.pin.all()
        discountLabel.pin.hCenter().vCenter().sizeToFit()
    }
}

