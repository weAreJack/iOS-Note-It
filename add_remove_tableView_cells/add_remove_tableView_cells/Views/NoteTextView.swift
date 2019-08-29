//
//  NoteTextView.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 28/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class NoteTextView : UITextView {
    
    // MARK: - Init
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
    fileprivate func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        keyboardDismissMode = .interactive
        textColor = .darkGray
        font = .systemFont(ofSize: 18)
        backgroundColor = UIColor(r: 245, g: 242, b: 210)
        clipsToBounds = true
        dropShadow()
    }
    
}
