//
//  UIViewControllerExtension.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 22/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func addStatusBarCover(colour: UIColor) {
        let statusBarCover = UIView()
        statusBarCover.backgroundColor = colour
        statusBarCover.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(statusBarCover)
        statusBarCover.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        statusBarCover.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        statusBarCover.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        statusBarCover.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    func deregisterFromKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
}
