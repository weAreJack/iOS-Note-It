//
//  ViewController.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 20/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

protocol NewEditNoteDelegate {
    func newEditNote(newNote: Note)
}

protocol UpdateNotesDelegate {
    func updateNote(note: Note)
}

class NotesHomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Properties
    
    let tableView = UITableView()
    let navBar = HomeNavBar()
    let reuseIdentifier = "customCell"
    let userDefaults = UserDefaults.standard
    
    var notes : [Note]!

    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserDefaults()
        setupUI()
    }
    
}

extension NotesHomeController : NewEditNoteDelegate, UpdateNotesDelegate {
    
    func updateNote(note: Note) {
        guard let cell = tableView.cellForRow(at: [0, note.noteIndex]) as? Customcell else {return}
        cell.note = note
        notes[note.noteIndex] = note
        updateUserDefaults()
    }
    
    func newEditNote(newNote: Note) {
        notes.append(newNote)
        tableView.insertRows(at: [[0, notes.count-1]], with: .automatic)
        tableView.scrollToRow(at: [0, notes.count-1], at: .top, animated: true)
        updateUserDefaults()
    }

}

