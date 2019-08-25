//
//  NoteNavBar.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 22/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class NoteNavBar: UIView {
    
    // MARK: - Properties
    
    let noteTitleLabel = UILabel()
    let noteDescriptionLabel = UILabel()
    let backButton = UIButton(type: .system)
    let editTitleDescriptionButton = UIButton(type: .system)
    
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
        
        let stackView = UIStackView(arrangedSubviews: [noteTitleLabel, noteDescriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        noteTitleLabel.font = .boldSystemFont(ofSize: 20)
        noteTitleLabel.textColor = .colour1
        noteTitleLabel.textAlignment = .center
        noteDescriptionLabel.font = .systemFont(ofSize: 16)
        noteDescriptionLabel.textColor = .colour1
        noteDescriptionLabel.textAlignment = .center
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        let backButtonImage = UIImage(imageLiteralResourceName: "arrow").withRenderingMode(.alwaysTemplate)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.tintColor = .colour5
        backButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        backButton.setImage(backButtonImage, for: .normal)
        
        addSubview(backButton)
        backButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 36).isActive = true
        
        editTitleDescriptionButton.translatesAutoresizingMaskIntoConstraints = false
        editTitleDescriptionButton.setImage(#imageLiteral(resourceName: "edit").withRenderingMode(.alwaysTemplate), for: .normal)
        editTitleDescriptionButton.tintColor = .colour5
        
        addSubview(editTitleDescriptionButton)
        editTitleDescriptionButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        editTitleDescriptionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        editTitleDescriptionButton.heightAnchor.constraint(equalToConstant: 26).isActive = true
        editTitleDescriptionButton.widthAnchor.constraint(equalToConstant: 26).isActive = true
        
    }
    
}
