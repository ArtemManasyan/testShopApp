//
//  TabBarViewController.swift
//  TestShopApp
//
//  Created by Артем Манасян on 15.03.2023.
//

import UIKit

class MainTabBarViewController: UIViewController {
    
    var selectedTypeButton: TabBarButton.TabBarButtonType = .home
    let mainTabBarViewModel = MainTabBarViewModel()
    let tabBarView = MainTabBarView()
    var counter: Int = 0
    let page1ViewController = Page1ViewController()
    let favoriteVC = UIViewController()
    let cartVC = UIViewController()
    let commentsVC = UIViewController()
    let profileViewController = ProfileViewController()
    
    var controllers = [UIViewController]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controllers = [page1ViewController, favoriteVC, cartVC, commentsVC, profileViewController]
        view.addSubview(tabBarView)
        tabBarView.backgroundColor = UIColor(hex: "#FFFFFF")
        tabBarView.layer.cornerRadius = 15
        view.backgroundColor = UIColor(hex: "#FAF9FF")
        mainTabBarViewModel.mainTabBarVC = self
        mainTabBarViewModel.viewDidLoad()
        didTapButton(with: selectedTypeButton)
    }
    
    func configTabBarItems(barItemType: TabBarModel) {
        tabBarView.set(newModel: barItemType)
    }
    
    
    func didTapButton(with type: TabBarButton.TabBarButtonType) {
        counter = type.rawValue
        let currentController = controllers[counter]
        currentController.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 90)
        self.view.addSubview(currentController.view)
        self.addChild(currentController)
        currentController.didMove(toParent: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBarView.pin.horizontally().bottom().height(90)

    }

}




