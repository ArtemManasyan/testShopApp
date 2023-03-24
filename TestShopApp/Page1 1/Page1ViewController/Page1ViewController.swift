//
//  Page1.swift
//  TestShopApp
//
//  Created by Артем Манасян on 13.03.2023.
//

import UIKit

class Page1ViewController: UIViewController {
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.register(CategoriesCell.self, forCellWithReuseIdentifier: "categoriesCell")
        collection.register(HeaderCell.self, forCellWithReuseIdentifier: "headerCell")
        collection.register(LatestCell.self, forCellWithReuseIdentifier: "latestCell")
        collection.register(FlashSaleCell.self, forCellWithReuseIdentifier: "flashSaleCell")
        return collection
    }()
    
    var cellTypes = [Page1ViewModel.CellType]()
    let page1ViewModel = Page1ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor(hex: "#FAF9FF")
        page1ViewModel.page1VC = self
        page1ViewModel.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.pin.all()
    }
    
    func configCells(_ cellTypes: [Page1ViewModel.CellType]) {
        self.cellTypes = cellTypes
        collectionView.reloadData()
    }
    
    func makeCells(indexPath: IndexPath) -> UICollectionViewCell {
        switch cellTypes[indexPath.row] {
        case .categories(let model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoriesCell", for: indexPath) as! CategoriesCell;
            cell.setupCell(model: model)
            return cell
        case .header(let model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "headerCell", for: indexPath) as! HeaderCell;
            cell.setupCell(model: model)
            return cell
        case .latest(let model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestCell", for: indexPath) as! LatestCell;
            cell.setupCell(models: model)
            return cell
        case .flash(let model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "flashSaleCell", for: indexPath) as! FlashSaleCell;
            cell.setupCell(models: model)
            return cell
        }
    }
}

extension Page1ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return makeCells(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init( width: collectionView.frame.width,
               height: cellTypes[indexPath.row].height(for: collectionView.frame.width))
    }
    
}
