//
//  CVViewControllerViewModel.swift
//  CodeChallange
//
//  Created by Salome Tsiramua on 9/24/19.
//  Copyright © 2019 Salome Tsiramua. All rights reserved.
//

import UIKit

class CVViewControllerViewModel {
    
    private enum Blocks: String {
        case personalInfo
        case education
        case experience
        case techSkills
        case softSkills
        case hobbies
        
        func cvBlockMirror(cv: CV) -> Mirror? {
            switch self {
            case .personalInfo:
                guard let personalInfo = cv.personalInfo else {
                    return nil
                }
                return Mirror(reflecting: personalInfo)
            case .education:
                guard let education = cv.education else {
                    return nil
                }
                return Mirror(reflecting: education)
            case .experience:
                guard let experience = cv.experience else {
                    return nil
                }
                return Mirror(reflecting: experience)
            case .techSkills:
                guard let techSkills = cv.techSkills else {
                    return nil
                }
                return Mirror(reflecting: techSkills)
            case .softSkills:
                guard let softSkills = cv.softSkills else {
                    return nil
                }
                return Mirror(reflecting: softSkills)
            default:
                guard let hobbies = cv.hobbies else {
                    return nil
                }
                return Mirror(reflecting: hobbies)
            }
        }
    }
    
    private var cv: CV? {
        didSet {
            
            guard let cv = cv else {
                return
            }
            
            let cvMirror = Mirror(reflecting: cv)
            
            cvBlockItems = cvMirror.children.map { (item) -> CVBlockItem in
                let block = Blocks(rawValue: item.label ?? "none")
                var items: [CVItem] = []
                block?.cvBlockMirror(cv: cv)?.children.forEach({ (item) in
                    var stringValue: String
                    var iconUrl: String?
                    if let value = item.value as? String {
                        stringValue = value
                    } else if let value = item.value as? CountryInfo {
                        stringValue = value.country
                        iconUrl = value.flag
                    } else if let value = item.value as? Years {
                        stringValue = "\(value.start) - \(String(describing: value.end))"
                    } else if let value = item.value as? [EducationInfo] {
                        stringValue = ""
                        value.forEach { (educationItem) in
                            stringValue += "\(educationItem.name)  \(educationItem.years.start) - \(educationItem.years.end)\n"
                        }
                        
                    } else {
                        stringValue = ""
                    }
                    
                    items.append(CVItem(title: item.label ?? "", value: stringValue, iconUrl: iconUrl))
                })
                return CVBlockItem(title: item.label ?? "", backgroundColor: UIColor.random.lighter, items: items)
                
            }
            
        }
    }
    
    private(set) var cvBlockItems: [CVBlockItem] = []
    
    func fetchData(completion: @escaping () -> Void) {
        
        Services.loadJson { (response) in
            self.cv = CV(personalInfo: response?.personalInfo, education: response?.education, experience: response?.experience, softSkills: response?.softSkills, techSkills: response?.techSkills, hobbies: response?.hobbies)
            completion()
        }
        
    }
}
