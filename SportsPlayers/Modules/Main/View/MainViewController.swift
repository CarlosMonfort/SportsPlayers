//
//  MainViewController.swift
//  SportsPlayers
//
//  Created by Carlos Monfort on 25/10/2019.
//  Copyright © 2019 Carlos Monfort. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var presenter: MainPresenterProtocol?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.mainPresenterViewDidLoad(from: self)
    }

}

extension MainViewController: MainViewProtocol {
    
    func mainViewUpdatePlayers() {
        tableView.reloadData()
    }
    
    func mainViewError(error: APIError) {
        presentAlert(title: NSLocalizedString("ALERT_ERROR", comment: ""), message: error.localizedDescription)
    }
}
