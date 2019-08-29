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
    
    let navBar = NoteNavBar()
    var delegate : UpdateNotesDelegate?
    var noteIndex : Int!
    var contentTextViewBottomConstraint : NSLayoutConstraint?
    var contentTextViewKeyboardConstraint : NSLayoutConstraint?
    
    var note : Note! {
        didSet {
            navBar.note = note
            contentTextView.text = note.content
            noteIndex = note.noteIndex
        }
    }
    
    lazy var contentTextView : NoteTextView = {
        let tv = NoteTextView()
        tv.delegate = self
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleDissmissKeyboard))
        swipeGesture.direction = .down
        tv.addGestureRecognizer(swipeGesture)
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
    
}

extension NoteController : NewEditNoteDelegate {
    
    func newEditNote(newNote: Note) {
        note = newNote
    }
    
}
