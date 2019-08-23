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
    
    fileprivate let tableView = UITableView()
    fileprivate let navBar = HomeNavBar()
    
    fileprivate var notes = [Note]()
    fileprivate let reuseIdentifier = "customCell"

    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seupUI()
    }
    
    // MARK: - Table View Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return notes.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 1:
            let addCellHeader = AddCellHeader()
            addCellHeader.button.addTarget(self, action: #selector(handlePresentForm), for: .touchUpInside)
            return addCellHeader
        default:
            return UITableViewHeaderFooterView()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! Customcell
            cell.titleLabel.text = notes[indexPath.row].title
            cell.descriptionLabel.text = notes[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = NoteController()
        controller.delegate = self
        controller.note = notes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(indexPath: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    // MARK: - Handlers
    
    fileprivate func seupUI() {
        
        view.backgroundColor = .white
        let safeArea = view.safeAreaLayoutGuide
        
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(tableView)
        view.addSubview(navBar)
        
        navBar.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        navBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        navBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        navBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(Customcell.self, forCellReuseIdentifier: reuseIdentifier)
        
        addStatusBarCover(colour: .white)
        
    }
    
    fileprivate func deleteAction(indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            self.notes.remove(at: indexPath.item)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            for i in indexPath.row..<self.notes.count {
                self.notes[i].noteIndex -= 1
            }
            completion(true)
        }
        action.backgroundColor = .red
        return action
    }
    
    @objc fileprivate func handlePresentForm() {
        
        let controller = NoteFormController()
        let form = NewNoteForm(headerText: "Add New Note", buttonText: "Add Note")
        controller.form = form
        controller.delegate = self
        controller.note = Note(title: nil, description: nil, content: nil, noteIndex: notes.count)
        controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        present(controller, animated: true, completion: nil)
        
    }

}

extension NotesHomeController : NewEditNoteDelegate, UpdateNotesDelegate {
    
    func updateNote(note: Note) {
        guard let cell = tableView.cellForRow(at: [0, note.noteIndex]) as? Customcell else {return}
        cell.titleLabel.text = note.title
        cell.descriptionLabel.text = note.description
        notes[note.noteIndex] = note
    }
    
    func newEditNote(newNote: Note) {
        notes.append(newNote)
        tableView.insertRows(at: [[0, notes.count-1]], with: .automatic)
        tableView.scrollToRow(at: [0, notes.count-1], at: .top, animated: true)
    }

}

