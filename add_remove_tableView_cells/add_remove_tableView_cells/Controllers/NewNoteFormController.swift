//
//  NewNoteFormController.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 22/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class NewNoteFormController : UIViewController {
    
    // MARK: - Properties
    
    fileprivate let form = NewNoteFormView()
    var delegate : NotesHomeDelegate?
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Handlers
    
    fileprivate func setupUI() {

        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .clear
        
        view.addSubview(form)
        form.addNoteButton.addTarget(self, action: #selector(handleSubmitForm), for: .touchUpInside)
        form.heightAnchor.constraint(equalToConstant: 300).isActive = true
        form.widthAnchor.constraint(equalToConstant: 300).isActive = true
        form.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        form.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    @objc fileprivate func handleSubmitForm() {
        
        let note = Note(title: form.titleField.text,
                        description: form.descriptionField.text,
                        content: nil)
        dismiss(animated: true) {
            self.delegate?.handleSubmitForm(newNote: note)
        }
        
    }
    
}
