//
//  FlashSaleCell.swift
//  TestShopApp
//
//  Created by Артем Манасян on 14.03.2023.
//

import UIKit

class FlashSaleCell: UICollectionViewCell {
    private var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 14
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.register(FlashSaleCollectionViewCell.self, forCellWithReuseIdentifier: "flashSale")
        return collection
    }()
    
    static var cellHeight: CGFloat = 221
    var models: [FlashCellModel]?
    
    func setupCell(models: [FlashCellModel]) {
        self.models = models
        addSubview(collection)
        collection.dataSource = self
        collection.delegate = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collection.pin.vertically().left(12).right()
    }
}
    
extension FlashSaleCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "flashSale", for: indexPath) as! FlashSaleCollectionViewCell
        guard let model = models?[indexPath.row] else { return UICollectionViewCell() }
        cell.set(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.bounds.width / 2) - 15, height: 221)
    }
}

struct FlashCellModel {
    let categoty: String
    let name: String
    let price: String
    let imageUrl: String
    let discount: String
    
    init(model: FlashParse) {
        categoty = model.category
        name = model.name
        price = "$\(model.price)"
        discount = "\(model.discount)% off"
        imageUrl = model.image
    }
}

class FlashSaleCollectionViewCell: UICollectionViewCell {
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    private let discountLabel = FlashDiscountViewLabel()
    private let categoryLabel = CategoryViewLabel()
    private let imageView = UIImageView()
    private let addButton = UIButton()
    private let addToFavouriteButton = UIButton()
    
    
    func set(model: FlashCellModel) {
        
        addSubviews([imageView, nameLabel, priceLabel, discountLabel, categoryLabel, addToFavouriteButton, addButton])
        
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.tintColor = #colorLiteral(red: 0.3493864708, green: 0.3493864708, blue: 0.3493864708, alpha: 1)
        addButton.layer.cornerRadius = 17.5
        addButton.backgroundColor = UIColor(hex: "#E5E9EF")
        addToFavouriteButton.setImage(UIImage(named: "favourite"), for: .normal)
        addToFavouriteButton.layer.cornerRadius = 14
        addToFavouriteButton.backgroundColor = UIColor(hex: "#E5E9EF")
        categoryLabel.set()
        categoryLabel.paddingView.layer.cornerRadius = 7
        categoryLabel.categoryLabel.textColor = .black
        categoryLabel.categoryLabel.text = model.categoty
        discountLabel.set()
        discountLabel.discountLabel.text = model.discount
        discountLabel.padding.layer.cornerRadius = 9
        priceLabel.textColor = UIColor(hex: "#FFFFFF")
        priceLabel.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        priceLabel.text = model.price
        nameLabel.font = UIFont(name: "Montserrat-SemiBold", size: 11)
        nameLabel.textColor = UIColor(hex: "#FFFFFF")
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.text = model.name
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.kf.setImage(with: URL(string: model.imageUrl))
        imageView.layer.cornerRadius = 15
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.pin.all()
        addButton.pin.height(35).width(35).bottom(7).right(4)
        addToFavouriteButton.pin.before(of: addButton, aligned: .center).marginRight(5).height(28).width(28)
        discountLabel.pin.top(7).right(8).width(50).height(18)
        categoryLabel.pin.left(10).bottom(83).width(50).height(17)
        nameLabel.pin.below(of: categoryLabel,aligned: .left).marginTop(10).before(of: addToFavouriteButton).sizeToFit(.width)
        priceLabel.pin.left(10).bottom(16).sizeToFit()
        
    }
}


