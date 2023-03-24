//
//  ProfileViewController.swift
//  TestShopApp
//
//  Created by Артем Манасян on 16.03.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var logOutCell: MenuCell.MenuCellType = .logOut
    var cellTypes = [ProfileViewModel.CellTypes]()
    let profileViewModel = ProfileViewModel()
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProfileInfoCell.self, forCellReuseIdentifier: "profileCell")
        tableView.register(MenuCell.self, forCellReuseIdentifier: "menuCell")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        profileViewModel.profileVC = self
        profileViewModel.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.pin.all()
    }
    
    
    func didTapLogOut(type: MenuCell.MenuCellType) {
        if type == logOutCell {
            let signInVC = SignInViewController()
            signInVC.modalPresentationStyle = .fullScreen
            self.dismiss(animated: true)
            self.show(signInVC, sender: nil)
        }
    }
    
    func configCell(_ cellTypes: [ProfileViewModel.CellTypes]) {
        self.cellTypes = cellTypes
        tableView.reloadData()
    }
    
    func makeCells(indexPath: IndexPath) -> UITableViewCell  {
        
        switch cellTypes[indexPath.row] {
            
        case .profileCellType(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileInfoCell;
            cell.setupCell(model: model)
            return cell
        case .menuCellType(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuCell;
            let type = model.buttonTypes[indexPath.row - 1]
            cell.setupCell(type: type)
            return cell
        }
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        makeCells(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        .init(cellTypes[indexPath.row].height(for: tableView.frame.width))
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        25
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        didTapLogOut(type: logOutCell)
        
    }
    
}
