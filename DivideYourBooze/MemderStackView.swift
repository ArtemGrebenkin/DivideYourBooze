//
//  MemderStackView.swift
//  DivideYourBooze
//
//  Created by Artem Grebenkin on 12/15/19.
//  Copyright © 2019 Artem Grebenkin. All rights reserved.
//

import UIKit

class MemberStackView: UIStackView {
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init() {
        super.init(frame: .zero)
        self.frame = CGRect(x: 20, y: 350, width: 70, height: 100)
        
        translatesAutoresizingMaskIntoConstraints = false
        //heightAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
        //widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        //let stackView = UIStackView(arrangedSubviews: [button, nameLabel, debtLabel])
        axis = .vertical
        alignment = .center
        spacing = 5
        distribution = .fill
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
