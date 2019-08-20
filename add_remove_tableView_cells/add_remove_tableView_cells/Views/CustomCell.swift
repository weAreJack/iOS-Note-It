//
//  CustomCell.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 20/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class Customcell : UITableViewCell {
    
    // MARK: - Properties
    
    let toolTip = UIImageView(image: #imageLiteral(resourceName: "notes").withRenderingMode(.alwaysTemplate))
    let arrowImage = UIImageView(image: #imageLiteral(resourceName: "arrow").withRenderingMode(.alwaysTemplate))
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
    func setupUI() {
        
        selectionStyle = .none
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(toolTip)
        addSubview(stackView)
        addSubview(arrowImage)
        
        toolTip.translatesAutoresizingMaskIntoConstraints = false
        toolTip.heightAnchor.constraint(equalToConstant: 30).isActive = true
        toolTip.widthAnchor.constraint(equalToConstant: 30).isActive = true
        toolTip.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        toolTip.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        toolTip.tintColor = .darkGray
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: toolTip.trailingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: arrowImage.leadingAnchor, constant: 16).isActive = true
        
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        arrowImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        arrowImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        arrowImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        arrowImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        arrowImage.tintColor = .darkGray
        
    }
}


