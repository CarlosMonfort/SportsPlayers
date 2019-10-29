//
//  UIViewController+Extension.swift
//  SportsPlayers
//
//  Created by Carlos Monfort on 25/10/2019.
//  Copyright © 2019 Carlos Monfort. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /**
     Presenta un UIAlertController
     - parameter title: Título del UIAlertController
     - parameter message: Mensaje a mostrar
     */
    func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("ALERT_OK", comment: ""), style: .default, handler: nil)
        alertController.addAction(okAction)
        alertController.preferredAction = okAction
        self.present(alertController, animated: true, completion: nil)
    }
}
