//
//  CVGroupTableViewCellViewModel.swift
//  CodeChallange
//
//  Created by Salome Tsiramua on 9/24/19.
//  Copyright © 2019 Salome Tsiramua. All rights reserved.
//

import UIKit

class CVGroupTableViewCellViewModel: CVGroupTableViewContent {

    var items: [CVItem]
    
    var title: String
    
    var backgroudColor: UIColor
    
    init(title: String, backgroundColor: UIColor, items: [CVItem]) {
        
        self.items = items
        self.title = title
        self.backgroudColor = backgroundColor
        
    }
    
}
