//
//  UIColorEntension.swift
//  add_remove_tableView_cells
//
//  Created by Jack Smith on 22/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

extension UIColor {
    
    static let colour1 = UIColor(r: 51, g: 101, b: 138)
    static let colour2 = UIColor(r: 242, g: 100, b: 25)
    static let colour3 = UIColor(r: 47, g: 72, b: 88)
    static let colour4 = UIColor(r: 245, g: 183, b: 0)
    static let colour5 = UIColor(r: 19, g: 22, b: 22)
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}
