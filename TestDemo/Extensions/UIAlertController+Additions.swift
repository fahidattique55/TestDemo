//
//  UIAlertController+Additions.swift
//  TestDemo
//
//  Created by Fahad Attique on 11/08/2019.
//  Copyright © 2019 Fahid. All rights reserved.
//

import UIKit

let rootViewController = UIViewController.topViewController()!

extension UIAlertController {
    
    static func showAlert(_ error: Error?, onController parentVC: UIViewController = rootViewController) {
        showCancelTypeAlert("", message: error?.localizedDescription ?? "", buttonTitle: "Ok", onController: parentVC)
    }
    
    static func showAlert(_ title: String, message: String, onController parentVC: UIViewController = rootViewController) {
        showCancelTypeAlert(title, message: message, buttonTitle: "Ok", onController: parentVC)
    }
    
    static func showCancelTypeAlert(_ title: String!, message: String!, buttonTitle bTitle: String, onController parentVC: UIViewController!) {
        showCancelTypeAlert(title, message: message, buttonTitle: bTitle, buttonAction: {(alertAction) in}, onController: parentVC)
    }
    
    static func showCancelTypeAlert(_ title: String!, message: String!, buttonTitle bTitle: String, buttonAction bAction: ((UIAlertAction?) -> Void)!, onController parentVC: UIViewController!) {
        _ = showAlert(title, message: message, buttonsDictionary: ["": {_ in}, bTitle: bAction], baseController: parentVC)
    }
    
    static func showAlert(_ title: String?, message: String?, buttonsDictionary buttons: Dictionary<String, (UIAlertAction?) -> Void>!, baseController parentVC: UIViewController!, preferredStyle: UIAlertController.Style = .alert) -> UIAlertController {
        
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        var count: Int = 0
        for (bTitle, bAction) in buttons {
            if bTitle != "" {
                var style: UIAlertAction.Style = UIAlertAction.Style.destructive
                if count > 1 {
                    style = UIAlertAction.Style.default
                } else if count == 1 {
                    style = UIAlertAction.Style.default
                } else {
                    style = UIAlertAction.Style.cancel
                }
                
                let alertAction: UIAlertAction = UIAlertAction(title: bTitle, style: style, handler: bAction)
                alertController.addAction(alertAction)
            }
            count += 1
        }
        parentVC.presentViewController(alertController)
        
        return alertController
    }
}


