//
//  CVBlockItem.swift
//  CodeChallange
//
//  Created by Salome Tsiramua on 9/25/19.
//  Copyright © 2019 Salome Tsiramua. All rights reserved.
//

import UIKit

struct CVBlockItem: CVGroupTableViewContent {
    
    var imageUrl: String?
    
    var title: String
    
    var backgroudColor: UIColor
    
    var items: [CVItem] = []
    
    init(title: String, backgroundColor: UIColor, items: [CVItem]) {
        
        self.title = title
        self.backgroudColor = backgroundColor
        self.items = items
        
    }
    
}
