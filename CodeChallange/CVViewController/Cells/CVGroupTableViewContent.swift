//
//  CVGroupTableViewContent.swift
//  CodeChallange
//
//  Created by Salome Tsiramua on 9/24/19.
//  Copyright © 2019 Salome Tsiramua. All rights reserved.
//

import UIKit

protocol CVGroupTableViewContent {
    
    var title: String { get set }
    
    var backgroudColor: UIColor { get set }
      
    var items: [CVItem] { get set }
    
}
