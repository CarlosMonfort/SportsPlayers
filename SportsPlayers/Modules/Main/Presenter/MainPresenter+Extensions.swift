//
//  MainPresenter+Extensions.swift
//  SportsPlayers
//
//  Created by Carlos Monfort on 25/10/2019.
//  Copyright © 2019 Carlos Monfort. All rights reserved.
//

import UIKit

extension MainPresenter: MainPresenterProtocol {
    
    func mainPresenterViewDidLoad(from view: MainViewController) {
        viewDidLoad(from: view)
    }
}

extension MainPresenter: MainOutputInteractorProtocol {
    
    func mainOutputSectionPlayersDataFetched(playersSections: [Section]) {
        DispatchQueue.main.async {
            self.playersSectionsList = playersSections
        }
    }
    
    func mainOutputError(error: APIError) {
        DispatchQueue.main.async {
            self.view?.mainViewError(error: error)
        }
    }
}

extension MainPresenter: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return playersSectionsList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersSectionsList[section].players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let player = playersSectionsList[indexPath.section].players[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.identifier, for: indexPath) as? PlayerTableViewCell else { view?.mainViewError(error: .custom(code: 0, message: "Cell Error")); return UITableViewCell()}
        cell.player = player
        
        return cell
    }
    
}
