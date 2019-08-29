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
    
    var note : Note? {
        didSet {
            titleLabel.text = note?.title
            descriptionLabel.text = note?.subTitle
        }
    }
    
    let titleLabel = setupLabel(font: .boldSystemFont(ofSize: 20))
    let descriptionLabel = setupLabel(font: .systemFont(ofSize: 18))
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
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        
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
    
    static func setupLabel(font: UIFont) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = .colour1
        label.textAlignment = .center
        return label
    }
    
}
