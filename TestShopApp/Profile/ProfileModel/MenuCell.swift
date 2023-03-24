//
//  MenuCell.swift
//  TestShopApp
//
//  Created by Артем Манасян on 18.03.2023.
//

import UIKit

class MenuCell: UITableViewCell {
    let paddingImageView = IconView()
    let cellNameLabel = UILabel()
    let rightTextLabel = UILabel()
    var type: MenuCellType?
    var model: MenuCellModel?
    static var requiredHeight: CGFloat = 55
    
    enum MenuCellType: Int, CaseIterable {
        case tradeStore = 0
        case paymentMethod
        case balance
        case tradeHistory
        case restorePurchase
        case help
        case logOut
        
        var name: String {
            switch self {
            case .tradeStore:
                return "Trade store"
            case .paymentMethod:
                return "Payment method"
            case .balance:
                return "Balance"
            case .tradeHistory:
                return "Trade history"
            case .restorePurchase:
                return "Restore purchase"
            case .help:
                return "Help"
            case .logOut:
                return "Log out"
            }
        }
        
        var icon: UIImage {
            switch self {
            case .tradeStore:
                return UIImage(named: "card")!
            case .paymentMethod:
                return UIImage(named: "card")!
            case .balance:
                return UIImage(named: "card")!
            case .tradeHistory:
                return UIImage(named: "card")!
            case .restorePurchase:
                return UIImage(named: "restore")!
            case .help:
                return UIImage(named: "help")!
            case .logOut:
                return UIImage(named: "logOut")!
            }
        }
        
        var disclosure: String {
            switch self {
            case .balance:
                return "$ 1593"
            case .help:
                return ""
            case .logOut:
                return ""
            default:
                return ">"
            }
        }
    }
    
    func categoryDidTap(model: MenuCellModel) {
        self.model = model
        model.menuButtonTapped(type!)
    }
    
    func setupCell(type: MenuCellType) {
        self.type = type
        addSubviews([paddingImageView, cellNameLabel, rightTextLabel])
        paddingImageView.set()
        paddingImageView.paddingImageView.image = type.icon
        paddingImageView.contentMode = .center
        paddingImageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        paddingImageView.layer.cornerRadius = paddingImageView.frame.height / 2
        paddingImageView.backgroundColor = UIColor(hex: "#EEEFF4")
        cellNameLabel.text = type.name
        cellNameLabel.font = UIFont(name: "Montserrat-Regular", size: 12)
        rightTextLabel.text = type.disclosure
        rightTextLabel.font = UIFont(name: "Montserrat-SemiBold", size: 15)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        paddingImageView.pin.vCenter().left(30).sizeToFit()
        cellNameLabel.pin.after(of: paddingImageView).marginLeft(8).vCenter().sizeToFit()
        rightTextLabel.pin.vCenter().right(40).sizeToFit()
    }
}

struct MenuCellModel {
    let menuButtonTapped: ((MenuCell.MenuCellType) -> Void)
    let buttonTypes: [MenuCell.MenuCellType]    
}

class IconView: UIView {
    let paddingImageView = UIImageView()
    
    func set() {
        addSubview(paddingImageView)
        paddingImageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        paddingImageView.layer.cornerRadius = paddingImageView.frame.height / 2
        paddingImageView.backgroundColor = UIColor(hex: "#EEEFF4")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        paddingImageView.pin.all()
    }
}
