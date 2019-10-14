//
//  CGFloat+extension.swift
//  CodeChallange
//
//  Created by Salome Tsiramua on 10/13/19.
//  Copyright © 2019 Salome Tsiramua. All rights reserved.
//

import UIKit

extension CGFloat {
    
    static func random() -> CGFloat {
        
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
        
    }
    
}
