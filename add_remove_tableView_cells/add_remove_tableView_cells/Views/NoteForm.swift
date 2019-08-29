//
//  NewNoteFormView.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 21/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class NoteForm : UIView, UITextFieldDelegate {
    
    // MARK: - Properties
    
    let headerLabel = UILabel()
    let titleLabel = setupLabel(text: "Note Tile")
    let descriptionLabel = setupLabel(text: "Note Description")
    lazy var titleField = setupTextField(placeholderText: "'Shopping List'")
    lazy var descriptionField = setupTextField(placeholderText: "'Christmas Shopping!'")
    
    var note: Note? {
        didSet {
            titleField.text = note?.title
            descriptionField.text = note?.subTitle
        }
    }
    
    let addNoteButton : UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.colour5, for: .normal)
        return button
    }()
    
    lazy var topLabel : UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .colour1
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.textColor = .colour2
        headerLabel.font = .systemFont(ofSize: 18)
        
        view.addSubview(headerLabel)
        headerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        return view
    }()
    
    // MARK: - Init
    
    init(headerText: String) {
        let frame = CGRect()
        super.init(frame: frame)
        headerLabel.text = headerText
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
