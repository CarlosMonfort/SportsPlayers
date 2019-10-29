//
//  MainProtocols.swift
//  SportsPlayers
//
//  Created by Carlos Monfort on 25/10/2019.
//  Copyright © 2019 Carlos Monfort. All rights reserved.
//

import UIKit

protocol MainViewProtocol: class {
    // Presenter -> View
    func mainViewUpdatePlayers()
    func mainViewError(error: APIError)
}

protocol MainPresenterProtocol: class {
    // View -> Presenter
    var view: MainViewProtocol? { get set }
    var interactor: MainInputInteractorProtocol? { get set }
    var wireframe: MainWireframeProtocol? { get set }
    
    func mainPresenterViewDidLoad(from view: MainViewController)
}

protocol MainInputInteractorProtocol: class {
    // Presenter -> Interactor
    var presenter: MainOutputInteractorProtocol? { get set }
    
    func mainInputGetPlayers()
}

protocol MainOutputInteractorProtocol: class {
    // Interactor -> Presenter
    func mainOutputSectionPlayersDataFetched(playersSections: [Section])
    func mainOutputError(error: APIError)
}

protocol MainWireframeProtocol: class {
    // Presenter -> Wireframe
    var viewController: UIViewController? { get set }
    
    static func mCreateMainModule() -> UIViewController
}
