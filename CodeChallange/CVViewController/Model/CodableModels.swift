//
//  CodableModels.swift
//  CodeChallange
//
//  Created by Salome Tsiramua on 10/13/19.
//  Copyright © 2019 Salome Tsiramua. All rights reserved.
//

import Foundation

struct Response: Codable {
    
    let personalInfo: PersonalInfo
    let education: Education
    let experience: Experience
    let softSkills: [String]
    let techSkills: [String]
    let hobbies: [String]
    
    private enum CodingKeys: String, CodingKey {
        case personalInfo = "personal_info"
        case education
        case experience
        case softSkills = "soft_skills"
        case techSkills = "tech_skills"
        case hobbies
    }
    
}

struct PersonalInfo: Codable {
    
    let name: String
    let email: String
    let phone: String
    let nationality: CountryInfo
    let residence: CountryInfo
    
}

struct Education: Codable {
    
    let schools: [EducationInfo]
    let universities: [EducationInfo]

}

struct CountryInfo: Codable {
    
    let country: String
    let flag: String
   
}

struct EducationInfo: Codable {
    
    let name: String
    let years: Years
    
}

struct Years: Codable {
    
    let start: Int
    let end: Int
    
}

struct Experience: Codable {
    
    let companyName: String
    let years: Years
    
}
