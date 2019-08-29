//
//  NewNoteForm+Handlers.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 28/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

extension NoteForm {
    
    static func setupLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        return label
    }
    
    func setupTextField(placeholderText: String) -> UITextField {
        let field = UITextField()
        field.placeholder = placeholderText
        field.delegate = self
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.count ?? 0
        if range.length + range.location > currentCharacterCount {
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        return newLength <= 28
    }
    
    func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .colour2
        clipsToBounds = true
        layer.cornerRadius = 10
        layer.borderColor = UIColor.colour1.cgColor
        layer.borderWidth = 2
        dropShadow()
        
        let titleFieldView = Fieldview()
        let descriptionFieldView = Fieldview()
        
        titleFieldView.addSubview(titleField)
        titleField.topAnchor.constraint(equalTo: titleFieldView.topAnchor).isActive = true
        titleField.leadingAnchor.constraint(equalTo: titleFieldView.leadingAnchor, constant: 8).isActive = true
        titleField.trailingAnchor.constraint(equalTo: titleFieldView.trailingAnchor, constant: -8).isActive = true
        titleField.bottomAnchor.constraint(equalTo: titleFieldView.bottomAnchor).isActive = true
        
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
