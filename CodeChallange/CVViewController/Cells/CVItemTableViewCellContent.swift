//
//  CVItemTableViewCellContent.swift
//  CodeChallange
//
//  Created by Salome Tsiramua on 9/24/19.
//  Copyright © 2019 Salome Tsiramua. All rights reserved.
//

import Foundation

protocol CVItemTableViewCellContent {
    
    var title: String { get set }
    
    var value: String { get set }
    
    var iconUrl: String? { get set }
    
}
