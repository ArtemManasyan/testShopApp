//
//  MainTabBarViewModel.swift
//  TestShopApp
//
//  Created by Артем Манасян on 16.03.2023.
//

import Foundation

class MainTabBarViewModel {
    
    var selectedTypeButton: TabBarButton.TabBarButtonType = .home
    weak var mainTabBarVC: MainTabBarViewController?
    
    
    func loadData() {
        let bottomTabBarModel = TabBarModel (
            categoryTap: { [unowned self] type in
                selectedTypeButton = type
                self.mainTabBarVC?.didTapButton(with: type)
                    loadData()
                },
            buttonTypes: TabBarButton.TabBarButtonType.allCases,
            selectedType: selectedTypeButton
        )
                
        mainTabBarVC?.configTabBarItems(barItemType: bottomTabBarModel)
    }
    
    
    func viewDidLoad() {
        loadData()
    }
    
    
  
}
