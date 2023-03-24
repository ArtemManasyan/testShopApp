//
//  Page1Model.swift
//  TestShopApp
//
//  Created by Артем Манасян on 13.03.2023.
//

import UIKit
import Kingfisher

class LatestCell: UICollectionViewCell {
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.register(LatestCollectionViewCell.self, forCellWithReuseIdentifier: "latest")
        return collection
    }()
    
    static var cellHeight: CGFloat = 190
    private var models: [LatestCellModel]?
    
    func setupCell(models: [LatestCellModel]) {
        self.models = models
        addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.pin.vertically().right().left(12)
    }
    
}

extension LatestCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latest", for: indexPath) as! LatestCollectionViewCell
        guard let model = models?[indexPath.row] else { return UICollectionViewCell()}
        cell.setCellSubviews(model: model)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.bounds.width / 3) , height: 149)
    }
}

struct LatestCellModel {
    let categoty: String
    let name: String
    let price: String
    let imageUrl: String
    
    init(model: LatestObjectParseModel) {
        categoty = model.category
        name = model.name
        price = "$\(model.price)"
        imageUrl = model.imageUrl
    }
}

class LatestCollectionViewCell: UICollectionViewCell {
    var categoryLabel = CategoryViewLabel()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    let imageView = UIImageView()
    let addButton = UIButton()
    
    func setCellSubviews(model: LatestCellModel) {

        addSubviews([imageView, categoryLabel, nameLabel, priceLabel, addButton])
        priceLabel.font = UIFont(name: "Montserrat-SemiBold", size: 10)
        priceLabel.textColor = UIColor(hex: "#FFFFFF")
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.layer.cornerRadius = 10
        addButton.tintColor = #colorLiteral(red: 0.3493864708, green: 0.3493864708, blue: 0.3493864708, alpha: 1)
        addButton.backgroundColor = UIColor(hex: "#E5E9EF")
        categoryLabel.set()
        categoryLabel.paddingView.layer.cornerRadius = 6
        categoryLabel.categoryLabel.font = UIFont(name: "Montserrat-SemiBold", size: 7)
        nameLabel.font = UIFont(name: "Montserrat-SemiBold", size: 10)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 13
        categoryLabel.categoryLabel.text = model.categoty
        nameLabel.text = model.name
        priceLabel.text = model.price
        imageView.kf.setImage(with: URL(string: model.imageUrl))
        nameLabel.font = UIFont(name: "Montserrat-SemiBold", size: 9)
        nameLabel.textColor = UIColor(hex: "#FFFFFF")
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.pin.all()
        
        addButton.pin.height(20).width(20).bottom(5).right(5)
        categoryLabel.pin.left(7).top(91).height(13).width(37)
        priceLabel.pin.left(8).bottom(5).sizeToFit()
        nameLabel.pin.below(of: categoryLabel).marginTop(5).left(8).before(of: addButton).marginRight(15).sizeToFit(.width)
        
    }
}


