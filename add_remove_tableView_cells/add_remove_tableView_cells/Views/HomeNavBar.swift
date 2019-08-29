//
//  CustomNavBar.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 22/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class HomeNavBar: UIView {
    
    // MARK: - Properties
    
    fileprivate let icon = UIImageView(image: #imageLiteral(resourceName: "notes"))
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    fileprivate func setupUI() {
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        dropShadow()
        
        addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        icon.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 36).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 36).isActive = true
        
    }
    
}

