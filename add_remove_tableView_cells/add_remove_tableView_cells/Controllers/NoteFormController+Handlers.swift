//
//  NoteFormController+Handlers.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 28/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

extension NoteFormController {
    
    func setupUI() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .clear
        
        view.addSubview(form)
        form.addNoteButton.addTarget(self, action: #selector(handleSubmitForm), for: .touchUpInside)
        form.heightAnchor.constraint(equalToConstant: 300).isActive = true
        form.widthAnchor.constraint(equalToConstant: 300).isActive = true
        form.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        form.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        form.titleField.addTarget(self, action: #selector(handleTitleFieldEditing), for: .editingChanged)
        form.descriptionField.addTarget(self, action: #selector(handleDescriptionFieldEditing), for: .editingChanged)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDissmissKeyboard)))
    }
    
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc fileprivate func handleTitleFieldEditing(textField: UITextField) {
        note.title = textField.text
    }
    
    @objc fileprivate func handleDescriptionFieldEditing(textField: UITextField) {
        note.subTitle = textField.text
    }
    
    @objc fileprivate func handleSubmitForm() {
        form.titleField.resignFirstResponder()
        form.descriptionField.resignFirstResponder()
        if note.title == nil {
            note.title = "New Note"
        }
        dismiss(animated: true) {
            self.delegate?.newEditNote(newNote: self.note)
        }
    }
    
    @objc func handleDissmissKeyboard() {
        form.titleField.resignFirstResponder()
        form.descriptionField.resignFirstResponder()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.5) {
                self.form.transform = CGAffineTransform(translationX: 0, y: -keyboardSize.height/2)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.5) {
            self.form.transform = .identity
        }
    }
    
}
