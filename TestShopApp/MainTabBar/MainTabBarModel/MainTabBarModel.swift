//
//  MainTabBarModel.swift
//  TestShopApp
//
//  Created by Артем Манасян on 16.03.2023.
//

import UIKit
import Foundation


class MainTabBarView: UIView, DelegateProtocol {
    
    var buttons = [TabBarButton]()
    var model: TabBarModel?
    
    func set(newModel: TabBarModel) {
        self.model = newModel
        
        buttons = newModel.buttonTypes.map {
            let button = TabBarButton()
            button.delegate = self
            button.configure(type: $0) { [weak self] selectedType in
                self?.model?.categoryTap?(selectedType)
            }
            
            return button
        }
        buttons.forEach(addSubview)
    }
    
    func didTapButton(with type: TabBarButton.TabBarButtonType) {
        model?.categoryTap?(type)
    }
    
    private func setHighlightedButton(with type: TabBarButton.TabBarButtonType) {
        buttons.forEach { button in
            button.setHighLighted(type == button.type)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        buttons.pairs.forEach { prev, current  in
            let size = CGSize(width: 70, height: 63)
//            let buttonsWidth = CGFloat(buttons.count) * size.width
            let space: CGFloat = 10
//            let space = (bounds.width - buttonsWidth) / 2
            
            if prev == buttons.first {
                prev.pin.size(size).left(space).vCenter()
            }
            current.pin.size(size).after(of: prev).vCenter()
        }
    }
}

struct TabBarModel {
    let categoryTap: ((TabBarButton.TabBarButtonType) -> Void)?
    let buttonTypes: [TabBarButton.TabBarButtonType]
    let selectedType: TabBarButton.TabBarButtonType
    
    
}

protocol DelegateProtocol {
    func didTapButton(with: TabBarButton.TabBarButtonType)
}

class TabBarButton: UIView {
    private let paddingView = UIImageView()
    var type: TabBarButtonType = .home
    var delegate: DelegateProtocol?
    
    
    enum TabBarButtonType: Int, CaseIterable {
        case home = 0
        case favorites
        case cart
        case comments
        case profile
        
        var image: UIImage {
            switch self {
            case .home:
                return UIImage(named: "house")!
            case .favorites:
                return UIImage(named: "favoriteButton")!
            case .cart:
                return UIImage(named: "cart")!
            case .comments:
                return UIImage(named: "commentsButton")!
            case .profile:
                return UIImage(named: "profile")!
            }
        }
    }
    
    func configure(type: TabBarButtonType, tapHadler: ((TabBarButtonType) -> Void)?) {
        self.type = type
        if paddingView.superview == nil { addSubview(paddingView) }
        paddingView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        paddingView.layer.cornerRadius = paddingView.frame.height / 2
        paddingView.image = type.image
        paddingView.contentMode = .center
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.numberOfTapsRequired = 1
        addGestureRecognizer(tap)
    }
    
    func setHighLighted(_ isOn: Bool) {
        paddingView.tintColor = isOn ? UIColor(hex: "#EEEFF4") : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        paddingView.backgroundColor = isOn ? UIColor(hex: "#EEEFF4") : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .ended {
            delegate?.didTapButton(with: type)
            paddingView.backgroundColor = UIColor(hex: "#EEEFF4")
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        paddingView.pin.vCenter().hCenter()
    }
}

fileprivate extension Collection {
    var pairs: AnySequence<(Element, Element)> {
        .init(zip(self, dropFirst()))
    }
}
