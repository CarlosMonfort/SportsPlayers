//
//  SplashWireframe.swift
//  SportsPlayers
//
//  Created by Carlos Monfort on 25/10/2019.
//  Copyright © 2019 Carlos Monfort. All rights reserved.
//

import UIKit

class SplashWireframe: SplashWireframeProtocol {
    
    // MARK: - Variables
    weak var viewController: UIViewController?
    
    // MARK: - Module Creation
    static func sCreateSplashModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let splashViewController = storyboard.instantiateViewController(withIdentifier: "SplashVC") as? SplashViewController else { return UIViewController() }
        
        let presenter: SplashPresenterProtocol & SplashOutputInteractorProtocol = SplashPresenter()
        let interactor: SplashInputInteractorProtocol = SplashInteractor()
        let wireframe = SplashWireframe()
        
        splashViewController.presenter = presenter
        presenter.view = splashViewController
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.presenter = presenter
        wireframe.viewController = splashViewController
        
        return splashViewController
    }
    
    func splashWirePresentMain() {
        let mainViewController = MainWireframe.mCreateMainModule()
        mainViewController.modalPresentationStyle = .overFullScreen
        viewController?.present(mainViewController, animated: true, completion: nil)
    }
}
