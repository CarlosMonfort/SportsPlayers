//
//  MainPresenter.swift
//  SportsPlayers
//
//  Created by Carlos Monfort on 25/10/2019.
//  Copyright © 2019 Carlos Monfort. All rights reserved.
//

import UIKit

class MainPresenter: NSObject {
    
    // MARK: - Variables
    var view: MainViewProtocol?
    var interactor: MainInputInteractorProtocol?
    var wireframe: MainWireframeProtocol?
    var playersSectionsList: [Section] = [] {
        didSet {
            view?.mainViewUpdatePlayers()
        }
    }
    
    // MARK: - Setup View
    func viewDidLoad(from view: MainViewController) {
        //view.navigationItem.title = NSLocalizedString("MAIN_TITLE", comment: "")
        setUpTableView(from: view)
        interactor?.mainInputGetPlayers()
    }
    
    func setUpTableView(from view: MainViewController) {
        view.tableView.delegate = self
        view.tableView.dataSource = self
        view.tableView.rowHeight = UITableView.automaticDimension
        view.tableView.tableFooterView = UIView()
        view.tableView.register(PlayerTableViewCell.nib, forCellReuseIdentifier: PlayerTableViewCell.identifier)
    }
}

