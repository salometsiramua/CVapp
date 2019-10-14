//
//  CVViewController.swift
//  CodeChallange
//
//  Created by Salome Tsiramua on 9/24/19.
//  Copyright © 2019 Salome Tsiramua. All rights reserved.
//

import UIKit

enum sections: Int {
    case general
    case education
    case experience
    case hobbies
    case none
}

class CVViewController: UIViewController {
    
    private lazy var viewModel: CVViewControllerViewModel = CVViewControllerViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    private var spinnerView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
       
        tableView.tableFooterView = UIView()
        
        showSpinnerView()
        
        viewModel.fetchData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.spinnerView?.isHidden = true
            }
        }
    }
    
    private func showSpinnerView() {
        
        guard spinnerView == nil else {
            spinnerView?.isHidden = false
            return
        }
        let child = SpinnerViewController()

        // add the spinner view controller
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)

        // wait two seconds to simulate some work happening
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // then remove the spinner view controller
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
        
        spinnerView = child.view
    }
}

extension CVViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.cvBlockItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CVGroupTableViewCell.identifier, for: indexPath) as? CVGroupTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(content: viewModel.cvBlockItems[indexPath.row])
     
        return cell
        
    }
    
}

