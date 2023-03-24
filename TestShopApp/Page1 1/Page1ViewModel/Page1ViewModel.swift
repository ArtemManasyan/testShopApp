//
//  Page1.1ViewModel.swift
//  TestShopApp
//
//  Created by Артем Манасян on 13.03.2023.
//

import UIKit

class Page1ViewModel {
    weak var page1VC: Page1ViewController?
    let service = Page1Service()
    
    func loadData() {
        let header1 = HeaderCellModel(titleText: "Latest", moreButtonText: "View all") {
        }
        let header2 = HeaderCellModel(titleText: "Flash Sale", moreButtonText: "View all") {
        }
        let categories = CategoriesCellModel(buttonTypes: CategoryButtonCollectionViewCell.ButtonType.allCases)
        
        service.getLatestObjects (completion: { [self] model in
            let latestModels = model.latest.map {
                LatestCellModel.init(model: $0)
            }
        
            service.getFlashSales { [self] model in
                let flashSaleModels = model.flashSale.map {
                    FlashCellModel.init(model: $0)
                }
                
                let cellTypes: [CellType] = [.categories(categories),
                                             .header(header1),
                                             .latest(latestModels),
                                             .header(header2),
                                             .flash(flashSaleModels) ]
                
                self.page1VC?.configCells(cellTypes)
            }
        })
    }
    
    func viewDidLoad() {
        loadData()
    }
    
    
    enum CellType {
        case categories(CategoriesCellModel)
        case header(HeaderCellModel)
        case latest([LatestCellModel])
        case flash([FlashCellModel])
        
        func height(for width: CGFloat) -> CGFloat {
            switch self {
            case .categories(let model):
                return CategoriesCell.dynamicSize(model: model, width: width)
            case .header(let model):
                return HeaderCell.dynamicSize(model: model, width: width)
            case .latest:
                return LatestCell.cellHeight
            case .flash:
                return FlashSaleCell.cellHeight
            
          
            }
        }
    }
}
