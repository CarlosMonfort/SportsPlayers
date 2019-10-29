//
//  SplashProtocols.swift
//  SportsPlayers
//
//  Created by Carlos Monfort on 25/10/2019.
//  Copyright © 2019 Carlos Monfort. All rights reserved.
//

import UIKit

protocol SplashViewProtocol: class {
    // Presenter -> View
    func splashViewError(error: APIError)
}

protocol SplashPresenterProtocol: class {
    // View -> Presenter
    var view: SplashViewProtocol? { get set }
    var interactor: SplashInputInteractorProtocol? { get set }
    var wireframe: SplashWireframeProtocol? { get set }
    
    func splashPresenterViewDidLoad(from view: SplashViewController)
    func splashPresenterViewDidAppear()
    func splashPresenterPresentMain()
}

protocol SplashInputInteractorProtocol: class {
    // Presenter -> Interactor
    var presenter: SplashOutputInteractorProtocol? { get set }
}

protocol SplashOutputInteractorProtocol: class {
    // Interactor -> Presenter
    func splashOutputError(error: APIError)
}

protocol SplashWireframeProtocol: class {
    // Presenter -> Wireframe
    var viewController: UIViewController? { get set }
    
    static func sCreateSplashModule() -> UIViewController
    func splashWirePresentMain()
}
