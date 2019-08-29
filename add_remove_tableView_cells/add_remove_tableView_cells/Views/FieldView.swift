//
//  FieldView.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 28/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class Fieldview : UIView {
    
    // MARK: - Properties
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 0, height: 36)
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
    fileprivate func setupUI() {
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 2
    }
    
}
