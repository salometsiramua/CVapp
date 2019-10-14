//
//  CVGroupTableViewCell.swift
//  CodeChallange
//
//  Created by Salome Tsiramua on 9/24/19.
//  Copyright © 2019 Salome Tsiramua. All rights reserved.
//

import UIKit

class CVGroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var stack: UIStackView!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        stack.arrangedSubviews.forEach { (subview) in
            stack.removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
    }
    func configure(content: CVGroupTableViewContent) {
        
        title.text = content.title
        
        content.items.forEach { (item) in
           
            let horizontalStackView = UIStackView()
            horizontalStackView.axis = .horizontal
            
            let label = UILabel()
            label.text = item.title + ": " + item.value
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 14)
            
            horizontalStackView.addArrangedSubview(label)
            
            guard let image = item.iconUrl else {
                
                stack.addArrangedSubview(horizontalStackView)
                return
            }
            
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            
            imageView.downloaded(from: image)
            
            horizontalStackView.addArrangedSubview(imageView)
            
            stack.addArrangedSubview(horizontalStackView)
        }
        
        contentView.backgroundColor = content.backgroudColor
        
    }
}
