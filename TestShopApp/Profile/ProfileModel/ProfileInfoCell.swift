//
//  ProfileModel.swift
//  TestShopApp
//
//  Created by Артем Манасян on 16.03.2023.
//

import UIKit

class ProfileInfoCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let photoImageView = UIImageView()
    private let changePhotoButton = UIButton()
    private let nameLabel = UILabel()
    private let uploadItemButton = UploadItemButtonView()
    private var model: ProfileInfoCellModel?
    static var requiredHeight: CGFloat = 290
    
    func setupCell(model: ProfileInfoCellModel) {
        self.model = model
        selectionStyle = .none
        addSubviews([titleLabel, photoImageView, changePhotoButton, nameLabel, uploadItemButton])
        titleLabel.text = "Profile"
        titleLabel.font = UIFont(name: "Montserrat-Bold", size: 13)
        photoImageView.image = UIImage(named: "profileAvatar")
        photoImageView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        photoImageView.layer.cornerRadius = photoImageView.frame.height / 2
        changePhotoButton.setTitle("Change photo", for: .normal)
        changePhotoButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 10)
        changePhotoButton.setTitleColor(UIColor(hex: "#808080"), for: .normal)
        nameLabel.text = "Satria Adhi Pradana"
        nameLabel.font = UIFont(name: "Montserrat-SemiBold", size: 15)
        uploadItemButton.backgroundColor = UIColor(hex: "#4E55D7")
        uploadItemButton.set()
        uploadItemButton.layer.cornerRadius = 15
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.pin.top(25).hCenter().sizeToFit()
        photoImageView.pin.below(of: titleLabel).marginTop(20).hCenter().sizeToFit()
        changePhotoButton.pin.below(of: photoImageView, aligned: .center).marginTop(9).sizeToFit()
        nameLabel.pin.below(of: changePhotoButton).marginTop(19).hCenter().sizeToFit()
        uploadItemButton.pin.below(of: nameLabel).marginTop(37).height(40).horizontally(43)
        
    }
}

struct ProfileInfoCellModel {

    let changePhotoPressed: (() -> Void)
}

class UploadItemButtonView: UIView {
    
private let upLoadItemButton = UIButton()
private let image = UIImageView()
    
    func set() {
        addSubviews([upLoadItemButton, image])
        upLoadItemButton.setTitle("Upload item", for: .normal)
        upLoadItemButton.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        upLoadItemButton.titleLabel?.textColor = .white
        image.image = UIImage(systemName: "square.and.arrow.up")
        image.tintColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        upLoadItemButton.pin.vCenter().hCenter().sizeToFit()
        image.pin.before(of: upLoadItemButton, aligned: .center).marginRight(40).sizeToFit()
    }
}
