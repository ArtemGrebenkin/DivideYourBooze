//
//  MainLabel.swift
//  DivideYourBooze
//
//  Created by Artem Grebenkin on 1/25/20.
//  Copyright © 2020 Artem Grebenkin. All rights reserved.
//

import UIKit

class MainLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        //translatesAutoresizingMaskIntoConstraints = false
        //heightAnchor.constraint(equalToConstant: 40).isActive = true
        //widthAnchor.constraint(equalToConstant: 150).isActive = true
        font = .systemFont(ofSize: 12)
        textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        numberOfLines = 1
        lineBreakMode = .byTruncatingTail
        textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
