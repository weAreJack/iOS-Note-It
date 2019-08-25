//
//  Note.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 22/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import Foundation

class Note: NSObject, NSCoding  {
    
    // MARK: - Properties
    
    var title : String?
    var subTitle : String?
    var content : String?
    var noteIndex : Int
    
    // MARK: - Init
    
    init(title: String?, subTitle: String?, content: String?, noteIndex: Int) {
        self.title = title
        self.subTitle = subTitle
        self.content = content
        self.noteIndex = noteIndex
    }
    
    required init?(coder aDecoder: NSCoder) {
        title = aDecoder.decodeObject(forKey: "title") as? String
        subTitle = aDecoder.decodeObject(forKey: "subTitle") as? String
        content = aDecoder.decodeObject(forKey: "content") as? String
        noteIndex = aDecoder.decodeInteger(forKey: "noteIndex")
    }
    
    // MARK: - Encoder
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(subTitle, forKey: "subTitle")
        aCoder.encode(content, forKey: "content")
        aCoder.encode(noteIndex, forKey: "noteIndex")
    }
    
}
