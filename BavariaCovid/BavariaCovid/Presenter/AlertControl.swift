//
//  AlertControl.swift
//  BavariaCovid
//
//  Created by PRAKASH on 12/18/20.
//

import UIKit

class AlertControl: NSObject {
    
    func showAlert(title : String, message : String, viewController : UIViewController, okButtonTitle : String)
    {
        let alertC  =   UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction =  UIAlertAction(title: okButtonTitle, style: .default, handler: nil)
        alertC.addAction(okAction)
        viewController.present(alertC, animated: true, completion: nil)
    }
    
    func showLocationAlertOn(viewController : UIViewController){
        let alert = UIAlertController(title: AlertMessage.allowLocationAccessTitle, message: AlertMessage.allowLocationAccessMessage, preferredStyle: UIAlertController.Style.alert)

        // Button to Open Settings
        alert.addAction(UIAlertAction(title: AlertMessage.settingsTitle, style: UIAlertAction.Style.default, handler: { action in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: {
                    (success) in
                })
            }
        }))
        alert.addAction(UIAlertAction(title: AlertMessage.skipTitle, style: UIAlertAction.Style.default, handler: { action in
        }))
        viewController.present(alert, animated: true, completion: nil)
    }
}
