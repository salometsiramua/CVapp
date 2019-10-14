//
//  Services.swift
//  CodeChallange
//
//  Created by Salome Tsiramua on 10/13/19.
//  Copyright © 2019 Salome Tsiramua. All rights reserved.
//

import Foundation

class Services {
    
    private static var urlPath = "https://gist.githubusercontent.com/salometsiramua/989830e1db96485cbcb0f20b5b2cf4ba/raw/ec34df4fd1bddb5ce5e1a7cdacf73625973a450e/CV.json"
    
    
    static func loadJson(completion: @escaping (Response?) -> Void) {
        
        guard let url = URL(string: urlPath) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let res = try JSONDecoder().decode(Response.self, from: data)
                print(res.personalInfo.name)
                completion(res)
            } catch let error {
                print(error)
                completion(nil)
            }
        }.resume()
    }
    
}


