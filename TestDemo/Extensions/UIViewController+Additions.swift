//
//  UIViewController+Additions.swift
//  TestDemo
//
//  Created by Fahad Attique on 11/08/2019.
//  Copyright © 2019 Fahid. All rights reserved.
//

import UIKit


extension UIViewController {
    
    // MARK:- Keyboard Editing
    
    func endEditing() {
        view.endEditing(true)
    }
    
    // MARK:- Presentation/Dismiss
    
    class func topViewController(_ base: UIViewController? = UIApplication.shared.windows.first!.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
    
    fileprivate func dismissPresentedController() {
        self.dismiss(animated: true, completion: { () -> Void in
        })
    }
    
    fileprivate func dismissPushedController() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func presentViewController(_ viewControllerToPresent: UIViewController) {
        self.presentViewController(viewControllerToPresent, animated: true)
    }
    
    func presentViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
        self.present(viewControllerToPresent, animated: flag) { () -> Void in
        }
    }
    
    func dismissViewController(_ completion: (() -> Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }
    
    @objc func dismissMe() {
        if let navigationViewController = self.navigationController {
            if (navigationViewController.viewControllers.count > 1) {
                dismissPushedController()
            } else {
                dismissPresentedController()
            }
            
        } else {
            dismissPresentedController()
        }
    }
    
    func addCancelButton() {
        
        let cancelButton = UIBarButtonItem.init(title: "Cancel", style: .plain, target: self, action: #selector(dismissMe))
        navigationItem.leftBarButtonItem = cancelButton
    }
}

