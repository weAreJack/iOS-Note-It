//
//  AddCellView.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 20/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class AddCellHeader : UIView {
    
    // MARK: - Properties
    
    fileprivate let button : UIButton = {
        let button = UIButton()
        button.setTitle("Add New Note", for: .normal)
        button.setTitleColor(.colour2, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Handlers
    
    func setupUI() {
        
        backgroundColor = .colour1
        
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
}
