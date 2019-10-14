//
//  ViewController.swift
//  CodeChallange
//
//  Created by Salome Tsiramua on 9/24/19.
//  Copyright © 2019 Salome Tsiramua. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loadPdfButton: UIButton!
    
    @IBOutlet weak var image: UIImageView!
    private let imageURL = "https://angel.co/cdn-cgi/image/width=400,height=400,format=auto,fit=cover/https://d1qb2nb5cznatu.cloudfront.net/users/7204748-original?1511942550"
    
    @IBAction func loadPdfAction(_ sender: UIButton) {
         
        guard let url = Bundle.main.url(forResource: "SalomeTsiramuaCV", withExtension: "pdf") else {
            return
        }
        
        let webView = WKWebView(frame: view.frame)
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
        let newViewController = UIViewController()
        
        newViewController.view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: newViewController.view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: newViewController.view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: newViewController.view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: newViewController.view.bottomAnchor)
        ])
        navigationController?.pushViewController(newViewController, animated: true)
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.downloaded(from: imageURL)
    }
    
    
}

