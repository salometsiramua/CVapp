//
//  CVItem.swift
//  CodeChallange
//
//  Created by Salome Tsiramua on 9/24/19.
//  Copyright © 2019 Salome Tsiramua. All rights reserved.
//

import Foundation

struct CVItem: CVItemTableViewCellContent {
    
    var title: String
    
    var value: String
    
    var iconUrl: String?
    
    init(title: String, value: String, iconUrl: String?) {
        
        self.title = title
        self.value = value
        self.iconUrl = iconUrl
    }
}
