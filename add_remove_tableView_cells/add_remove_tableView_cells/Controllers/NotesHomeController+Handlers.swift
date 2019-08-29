//
//  NotesHomeController+Handlers.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 28/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

extension NotesHomeController {
    
    func setupUI() {
        
        view.backgroundColor = .white
        let safeArea = view.safeAreaLayoutGuide
        
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(tableView)
        view.addSubview(navBar)
        
        navBar.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        navBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        navBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        navBar.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
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
    
    func deleteAction(indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            self.notes.remove(at: indexPath.item)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            for i in indexPath.row..<self.notes.count {
                self.notes[i].noteIndex -= 1
            }
            self.updateUserDefaults()
            completion(true)
        }
        action.backgroundColor = .red
        return action
    }
    
    @objc func handlePresentForm() {
        
        let controller = NoteFormController()
        let form = NoteForm(headerText: "New Note")
        controller.form = form
        controller.delegate = self
        controller.note = Note(title: nil, subTitle: nil, content: nil, noteIndex: notes.count)
        controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        present(controller, animated: true, completion: nil)
        
    }
    
    func updateUserDefaults() {
        if let savedNotes = try? NSKeyedArchiver.archivedData(withRootObject: notes ?? [Note](), requiringSecureCoding: false) {
            userDefaults.set(savedNotes, forKey: "notes")
        }
    }
    
    func loadUserDefaults() {
        if let savedNotes = userDefaults.object(forKey: "notes") as? Data {
            if let decodedNotes = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedNotes) as? [Note] {
                notes = decodedNotes
            } else {
                notes = [Note]()
            }
        } else {
            notes = [Note]()
        }
    }
    
}
