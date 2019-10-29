//
//  SplashPresenter.swift
//  SportsPlayers
//
//  Created by Carlos Monfort on 25/10/2019.
//  Copyright © 2019 Carlos Monfort. All rights reserved.
//

import UIKit

class SplashPresenter {
    
    var view: SplashViewProtocol?
    var interactor: SplashInputInteractorProtocol?
    var wireframe: SplashWireframeProtocol?
    
    func viewDidLoad(from view: SplashViewController) {
        view.activityIndicator.startAnimating()
        view.lbTitle.text = NSLocalizedString("SPLASH_TITLE", comment: "")
        view.lbTitle.font = UIFont.preferredFont(forTextStyle: .title1)
        view.lbTitle.numberOfLines = 0
        view.lbTitle.lineBreakMode = .byWordWrapping
    }
}

extension SplashPresenter: SplashPresenterProtocol {
    
    func splashPresenterViewDidLoad(from view: SplashViewController) {
        viewDidLoad(from: view)
    }
    
    func splashPresenterViewDidAppear() {
        
    }
    
    func splashPresenterPresentMain() {
        wireframe?.splashWirePresentMain()
    }
}

extension SplashPresenter: SplashOutputInteractorProtocol {
    
    func splashOutputError(error: APIError) {
        view?.splashViewError(error: error)
    }
}
