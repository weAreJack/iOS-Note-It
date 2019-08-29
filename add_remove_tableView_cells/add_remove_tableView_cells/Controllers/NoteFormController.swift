//
//  NewNoteFormController.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 22/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class NoteFormController : UIViewController {
    
    // MARK: - Properties
    
    var delegate : NewEditNoteDelegate?
    var form : NoteForm!
    var note : Note! {
        didSet {
            form.note = note
        }
    }
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerKeyboardNotifications()
    }
    
    // MARK: - ViewWillDisappear
    
    override func viewWillDisappear(_ animated: Bool) {
        deregisterFromKeyboardNotifications()
    }
    
}
