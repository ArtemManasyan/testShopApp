//
//  HeaderCell.swift
//  TestShopApp
//
//  Created by Артем Манасян on 14.03.2023.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    private var titleLabel = UILabel()
    private var moreButton = UIButton()
    private var model: HeaderCellModel?
    
    func setupCell(model: HeaderCellModel) {
        self.model = model
        titleLabel.text = model.titleText
        moreButton.setTitle(model.moreButtonText, for: .normal)
        moreButton.addTarget(self, action: #selector(didTapmoreButton) , for: .touchUpInside)
        addSubview(titleLabel)
        addSubview(moreButton)
        titleLabel.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        moreButton.setTitleColor(UIColor(hex: "#808080"), for: .normal)
        moreButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 12)
        self.backgroundColor = .clear
        
    }
    
    static func dynamicSize(model: HeaderCellModel, width: CGFloat) -> CGFloat {
        
        return CGFloat(38)
    }
    
    @objc func didTapmoreButton() {
        model?.moreButtonAction?()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.pin.left(17).width(200).height(35).vCenter()
        moreButton.pin.right(17).width(80).height(35).vCenter()
    }
}

struct HeaderCellModel {
    var titleText: String
    let moreButtonText: String
    var moreButtonAction: (() -> Void)?
}

