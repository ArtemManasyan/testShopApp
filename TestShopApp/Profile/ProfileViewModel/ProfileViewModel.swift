//
//  ProfileViewModel.swift
//  TestShopApp
//
//  Created by Артем Манасян on 16.03.2023.
//

import Foundation
import UIKit

class ProfileViewModel {
    
    var selectedTypeCell: MenuCell.MenuCellType?
    weak var profileVC: ProfileViewController?
    
    
    func dataCells() {
        
        let profileCellModel = ProfileInfoCellModel {
            
        }
        
        let menuCellModel = MenuCellModel (
            menuButtonTapped:  { [unowned self] type in
                self.profileVC?.didTapLogOut(type: type)
            },
            buttonTypes: MenuCell.MenuCellType.allCases
        )
        
        let cellTypes: [CellTypes] = [ .profileCellType(profileCellModel),
                                       .menuCellType(menuCellModel),
                                       .menuCellType(menuCellModel),
                                       .menuCellType(menuCellModel),
                                       .menuCellType(menuCellModel),
                                       .menuCellType(menuCellModel),
                                       .menuCellType(menuCellModel),
                                       .menuCellType(menuCellModel)]
        
        self.profileVC?.configCell(cellTypes)
        
    }
    
    func viewDidLoad() {
        dataCells()
    }
    
    enum CellTypes {
        case profileCellType(ProfileInfoCellModel)
        case menuCellType(MenuCellModel)
        
        func height(for width: CGFloat) -> CGFloat {
            switch self {
            case .profileCellType:
                return ProfileInfoCell.requiredHeight
            case .menuCellType:
                return MenuCell.requiredHeight
            }
        }
    }
    
}
