//
//  ViewController.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 20/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

protocol NotesHomeDelegate {
    func handleSubmitForm(newNote: Note)
}

class NotesHome: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Properties
    
    fileprivate let tableView = UITableView()
    fileprivate let navBar = HomeNavBar()
    
    fileprivate var fields = [Note]()
    fileprivate let reuseIdentifier = "customCell"

    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        let safeArea = view.safeAreaLayoutGuide
        
        navigationController?.navigationBar.isHidden = true
        view.addSubview(navBar)
        navBar.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        navBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        navBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        navBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(Customcell.self, forCellReuseIdentifier: reuseIdentifier)
        
        addStatusBarCover(colour: .white)
        
    }
    
    // MARK: - Table View Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return fields.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 4
        case 1:
            return 60
        default:
            return 700
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 1:
            let addCellHeader = AddCellView()
            addCellHeader.button.addTarget(self, action: #selector(handleAddNewNote), for: .touchUpInside)
            return addCellHeader
        default:
            return UITableViewHeaderFooterView()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! Customcell
            cell.titleLabel.text = fields[indexPath.row].title
            cell.descriptionLabel.text = fields[indexPath.row].description
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(indexPath: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    // MARK: - Handlers
    
    fileprivate func deleteAction(indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            self.fields.remove(at: indexPath.item)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completion(true)
        }
        action.backgroundColor = .red
        return action
    }
    
    @objc fileprivate func handleAddNewNote() {
        
        let controller = NewNoteFormController()
        controller.delegate = self
        controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        present(controller, animated: true, completion: nil)
        
    }

}

extension NotesHome : NotesHomeDelegate {
    
    func handleSubmitForm(newNote: Note) {
        fields.append(newNote)
        tableView.insertRows(at: [[0, fields.count-1]], with: .automatic)
    }

}

