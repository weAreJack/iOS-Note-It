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
    
    let notesIcon = UIImageView(image: #imageLiteral(resourceName: "notes").withRenderingMode(.alwaysTemplate))
    let notesLabel = UILabel()
    
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
        
        let stackView = UIStackView(arrangedSubviews: [notesIcon, notesLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        notesIcon.tintColor = .colour1
        notesIcon.heightAnchor.constraint(equalToConstant: 36).isActive = true
        notesIcon.widthAnchor.constraint(equalToConstant: 36).isActive = true
        
        notesLabel.font = .boldSystemFont(ofSize: 20)
        notesLabel.text = "Notes"
        notesLabel.textColor = .colour1
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        
    }
    
}

