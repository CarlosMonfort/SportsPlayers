//
//  MainInteractor.swift
//  SportsPlayers
//
//  Created by Carlos Monfort on 25/10/2019.
//  Copyright © 2019 Carlos Monfort. All rights reserved.
//

import UIKit

class MainInteractor {
    
    // MARK: - Variables
    var presenter: MainOutputInteractorProtocol?
    
    // MARK: - Get Players
    func getPlayersData() {
        APIClient.shared.performGetRequest { (result) in
            switch result {
            case .success(let response):
                self.manageGetPlayersResponse(response)
            case .failure(let responseError):
                self.presenter?.mainOutputError(error: responseError)
            }
        }
    }
    
    func manageGetPlayersResponse(_ response: Data?) {
        do {
            guard let data = response else { self.presenter?.mainOutputError(error: .noData); return }
            let sections = try JSONDecoder().decode([Section].self, from: data)
            self.presenter?.mainOutputSectionPlayersDataFetched(playersSections: sections)
        } catch {
            self.presenter?.mainOutputError(error: .decodingFailure)
        }
    }
}

extension MainInteractor: MainInputInteractorProtocol {
    
    func mainInputGetPlayers() {
        getPlayersData()
    }
}

