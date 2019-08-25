//
//  NewNoteFormView.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 21/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class NewNoteForm : UIView, UITextFieldDelegate {
    
    // MARK: - Properties
    
    fileprivate let headerLabel = UILabel()
    fileprivate lazy var topLabel : UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.textColor = .white
        
        view.addSubview(headerLabel)
        headerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        return view
    }()
    
    fileprivate let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Note Title"
        return label
    }()
    
    fileprivate let descriptionLabel : UILabel = {
        let label = UILabel()
        label.text = "Note Description"
        return label
    }()
    
    lazy var titleField : UITextField = {
        let field = UITextField()
        field.placeholder = "'Shopping List'"
        field.delegate = self
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    lazy var descriptionField : UITextField = {
        let field = UITextField()
        field.placeholder = "'Christmas presents and food!'"
        field.delegate = self
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let addNoteButton : UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
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
    
    // MARK: - UITextField Delegate Methods
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.count ?? 0
        if range.length + range.location > currentCharacterCount {
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        return newLength <= 28
    }
    
    // MARK: - Handlers
    
    fileprivate func setupUI() {
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(r: 240, g: 240, b: 240)
        clipsToBounds = true
        layer.cornerRadius = 10
        layer.borderColor = UIColor(r: 240, g: 240, b: 240).cgColor
        layer.borderWidth = 2
        
        let titleFieldView = UIView()
        titleFieldView.backgroundColor = .white
        titleFieldView.clipsToBounds = true
        titleFieldView.layer.cornerRadius = 2
        titleFieldView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        titleFieldView.addSubview(titleField)
        titleField.topAnchor.constraint(equalTo: titleFieldView.topAnchor).isActive = true
        titleField.leadingAnchor.constraint(equalTo: titleFieldView.leadingAnchor, constant: 8).isActive = true
        titleField.trailingAnchor.constraint(equalTo: titleFieldView.trailingAnchor, constant: -8).isActive = true
        titleField.bottomAnchor.constraint(equalTo: titleFieldView.bottomAnchor).isActive = true
        
        let descriptionFieldView = UIView()
        descriptionFieldView.backgroundColor = .white
        descriptionFieldView.clipsToBounds = true
        descriptionFieldView.layer.cornerRadius = 2
        descriptionFieldView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        descriptionFieldView.addSubview(descriptionField)
        descriptionField.topAnchor.constraint(equalTo: descriptionFieldView.topAnchor).isActive = true
        descriptionField.leadingAnchor.constraint(equalTo: descriptionFieldView.leadingAnchor, constant: 8).isActive = true
        descriptionField.trailingAnchor.constraint(equalTo: descriptionFieldView.trailingAnchor, constant: -8).isActive = true
        descriptionField.bottomAnchor.constraint(equalTo: descriptionFieldView.bottomAnchor).isActive = true
        
        let topStackView = UIStackView(arrangedSubviews: [titleLabel, titleFieldView])
        topStackView.axis = .vertical
        topStackView.spacing = 8
        
        let bottomstackView = UIStackView(arrangedSubviews: [descriptionLabel, descriptionFieldView])
        bottomstackView.axis = .vertical
        bottomstackView.spacing = 8
        
        let stackView = UIStackView(arrangedSubviews: [topStackView, bottomstackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        
        addSubview(topLabel)
        addSubview(stackView)
        addSubview(addNoteButton)
        
        topLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: addNoteButton.topAnchor, constant: -8).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addNoteButton.translatesAutoresizingMaskIntoConstraints = false
        addNoteButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        addNoteButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
    }
    
    
}
