//
//  NoteController.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 22/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

protocol NoteControllerDelegate {
    func handleSubmitForm(editedNote: Note)
}

class NoteController : UIViewController, UITextViewDelegate {
    
    // MARK: - Properties
    
    var note : Note! {
        didSet {
            
            navBar.noteTitleLabel.text = note.title
            navBar.noteDescriptionLabel.text = note.description
            contentTextView.text = note.content
            noteIndex = note.noteIndex
            
        }
    }
    
    var delegate : UpdateNotesDelegate?
    var noteIndex : Int!
    
    let navBar = NoteNavBar()
    let contentTextView : UITextView = {
        let tv = UITextView()
        
        
        return tv
    }()
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        deregisterFromKeyboardNotifications()
    }
    
    // MARK: - TextViewDelegate Methods
    
    func textViewDidChange(_ textView: UITextView) {
        note.content = textView.text
    }
    
    // MARK: - Handlers
    
    fileprivate func setupUI() {
        
        view.backgroundColor = .white
        let safeArea = view.safeAreaLayoutGuide
        
        navigationController?.navigationBar.isHidden = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDissmissKeyboard)))
        
        view.addSubview(contentTextView)
        view.addSubview(navBar)
        
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        contentTextView.backgroundColor = UIColor(r: 242, g: 238, b: 203)
        contentTextView.clipsToBounds = true
        contentTextView.layer.cornerRadius = 10
        contentTextView.textColor = .darkGray
        contentTextView.font = .systemFont(ofSize: 18)
        contentTextView.dropShadow()
        contentTextView.delegate = self
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleDissmissKeyboard))
        swipeGesture.direction = .down
        contentTextView.addGestureRecognizer(swipeGesture)
        
        contentTextView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 8).isActive = true
        contentTextView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8).isActive = true
        contentTextView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8).isActive = true
        contentTextView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -8).isActive = true
        
        navBar.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        navBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        navBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        navBar.heightAnchor.constraint(equalToConstant: 100).isActive = true
        navBar.backButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        navBar.editTitleDescriptionButton.addTarget(self, action: #selector(handlePresentForm), for: .touchUpInside)
        
        addStatusBarCover(colour: .white)
    
    }
    
    fileprivate func deregisterFromKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    fileprivate func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc fileprivate func handlePresentForm() {
        
        let controller = NoteFormController()
        let form = NewNoteForm(headerText: "Edit Note Headings", buttonText: "Edit Note")
        controller.form = form
        controller.delegate = self
        controller.note = note
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
            UIView.animate(withDuration: 0.5) {
                self.view.transform = CGAffineTransform(translationX: 0, y: -keyboardSize.height)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.5) {
            self.view.transform = .identity
        }
    }
    
}

extension NoteController : NewEditNoteDelegate {
    
    func newEditNote(newNote: Note) {
        note = newNote
    }
    
}
