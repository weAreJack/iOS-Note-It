//
//  NoteController+Handlers.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 28/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

extension NoteController {
    
    func setupUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDissmissKeyboard)))
        
        view.addSubview(contentTextView)
        view.addSubview(navBar)
        
        let safeArea = view.safeAreaLayoutGuide
        contentTextView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 8).isActive = true
        contentTextView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8).isActive = true
        contentTextView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8).isActive = true
        contentTextViewBottomConstraint = contentTextView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -8)
        contentTextViewBottomConstraint?.isActive = true
        
        navBar.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        navBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        navBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        navBar.heightAnchor.constraint(equalToConstant: 100).isActive = true
        navBar.backButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        navBar.editTitleDescriptionButton.addTarget(self, action: #selector(handlePresentForm), for: .touchUpInside)
        
        addStatusBarCover(colour: .white)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        note.content = textView.text
    }
    
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc fileprivate func handlePresentForm() {
        let controller = NoteFormController()
        let form = NoteForm(headerText: "Edit Note Headings")
        controller.form = form
        controller.note = note
        controller.delegate = self
        controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        present(controller, animated: true, completion: nil)
    }
    
    @objc fileprivate func handleDismiss() {
        delegate?.updateNote(note: note)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleDissmissKeyboard() {
        contentTextView.resignFirstResponder()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            contentTextViewKeyboardConstraint = contentTextView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -(keyboardSize.height+8))
            contentTextViewBottomConstraint?.isActive = false
            contentTextViewKeyboardConstraint?.isActive = true
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        contentTextViewKeyboardConstraint?.isActive = false
        contentTextViewBottomConstraint?.isActive = true
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
}
