//
//  Response+extensions.swift
//  CodeChallange
//
//  Created by Salome Tsiramua on 10/13/19.
//  Copyright © 2019 Salome Tsiramua. All rights reserved.
//

import Foundation

extension Response {
    
    var cv: CV {
        return CV(personalInfo: self.personalInfo, education: self.education, experience: self.experience, softSkills: self.softSkills, techSkills: self.techSkills, hobbies: self.hobbies)
    }
}
