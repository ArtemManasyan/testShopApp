//
//  CategoriesCell.swift
//  TestShopApp
//
//  Created by Артем Манасян on 14.03.2023.
//

import UIKit


class CategoriesCell: UICollectionViewCell {
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryButtonCollectionViewCell.self, forCellWithReuseIdentifier: "categoryButton")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    var model: CategoriesCellModel?
    var buttons: [CategoryButtonCollectionViewCell]?
    let textField = LogInTextField()
    let titleLabel = UILabel()
    let bataLabel = UILabel()
    let topMenuButton = UIButton()
    let avatarImage = UIImageView()
    let locationLabel = UILabel()
    let locationButton = UIButton()
    
    func setupCell(model: CategoriesCellModel) {
        self.model = model
        buttons = model.buttonTypes.map {
            let button = CategoryButtonCollectionViewCell()
            button.configure(type: $0)
            return button
        }
        addSubviews([textField, titleLabel, topMenuButton, avatarImage, locationLabel, locationButton, collectionView, bataLabel])
        collectionView.dataSource = self
        collectionView.delegate = self
        textField.addIconToTextField(imageName:  "search")
        textField.attributePlaceholder()
        textField.textField.placeholder = "What are u looking for?"
        titleLabel.text = "Trade by"
        titleLabel.font = UIFont(name: "Montserrat-Bold", size: 15)
        bataLabel.text = "bata"
        bataLabel.textColor = UIColor(hex: "#4E55D7")
        topMenuButton.setImage(UIImage(named: "list"), for: .normal)
        avatarImage.image = UIImage(named: "avatarImage")
        locationLabel.text = "Location"
        locationLabel.font = UIFont(name: "Montserrat-Regular", size: 9)
        locationButton.setImage(UIImage(named: "locationButton"), for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topMenuButton.pin.left(15).top(23).sizeToFit()
        avatarImage.pin.right(47).top(22).sizeToFit()
        titleLabel.pin.horizontallyBetween(topMenuButton, and: avatarImage, aligned: .center).marginLeft(85).sizeToFit()
        bataLabel.pin.after(of: titleLabel, aligned: .center).marginLeft(5).sizeToFit()
        locationLabel.pin.below(of: avatarImage).marginTop(10).right(47).sizeToFit()
        locationButton.pin.after(of: locationLabel, aligned: .center).marginLeft(4).sizeToFit()
        textField.pin.below(of: titleLabel).marginTop(34).horizontally(56).height(24)
        collectionView.pin.below(of: textField).marginTop(17).bottom().horizontally(8)
    }
    
    static func dynamicSize(model: CategoriesCellModel, width: CGFloat) -> CGFloat {
        
        return CGFloat(243)
    }
}

extension CategoriesCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model?.buttonTypes.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryButton", for: indexPath) as! CategoryButtonCollectionViewCell
        guard let button =  buttons?[indexPath.row] else { return UICollectionViewCell()}
        cell.configure(type: button.type)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 50, height: 60)
    }
}

struct CategoriesCellModel {
    let buttonTypes: [CategoryButtonCollectionViewCell.ButtonType]
}

class CategoryButtonCollectionViewCell: UICollectionViewCell {
    private var nameLabel = UILabel()
    private let circleView = UIImageView()
    var type: ButtonType!
    
    enum ButtonType: String, CaseIterable {
        case phones
        case headphones
        case games
        case cars
        case furniture
        case kids
        var name : String {
            rawValue.capitalized
        }
        
        var image: UIImage {
            UIImage(named: rawValue)!
        }
    }
    
    func configure(type: ButtonType) {
        self.type = type
        addSubviews([nameLabel, circleView])
        circleView.frame = CGRect(x: 0, y: 0, width: 42, height: 38)
        circleView.layer.cornerRadius = circleView.frame.height / 2
        nameLabel.text = type.name
        circleView.image = type.image
        circleView.backgroundColor = UIColor(hex: "#EEEFF4")
        nameLabel.textColor = UIColor(hex: "#A6A7AB")
        nameLabel.font = UIFont(name: "Montserrat-Regular", size: 10)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleView.contentMode = .center
        circleView.pin.top().hCenter()
        nameLabel.pin.below(of: circleView, aligned: .center).marginTop(12).sizeToFit()
        
    }
}
