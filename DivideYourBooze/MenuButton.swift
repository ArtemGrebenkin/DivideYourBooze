//
//  MenuButton.swift
//  DivideYourBooze
//
//  Created by Artem Grebenkin on 12/18/19.
//  Copyright © 2019 Artem Grebenkin. All rights reserved.
//

import UIKit

class MenuButton: UIButton {
    
    //let width: CGFloat = 40
    //let height: CGFloat = 100
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.frame = CGRect(x: 20, y: 350, width: 30, height: 120)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        layer.borderWidth = 1
        heightAnchor.constraint(equalToConstant: 30).isActive = true
        widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    convenience init(title: String, color: CGColor) {
        self.init()
        setTitle(title, for: .normal)
        setTitleColor(UIColor(cgColor: color), for: .normal)
        layer.borderColor = color
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
