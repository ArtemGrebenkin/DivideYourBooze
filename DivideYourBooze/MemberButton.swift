//
//  MemberButton.swift
//  DivideYourBooze
//
//  Created by Artem Grebenkin on 12/5/19.
//  Copyright © 2019 Artem Grebenkin. All rights reserved.
//

import UIKit

class MemberButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        let plusImage = UIImage(named: "plusButton.png")
        setImage(plusImage, for: .normal)
        self.frame = CGRect(x: 20, y: 350, width: 60, height: 60)
        backgroundColor = #colorLiteral(red: 0.9967270494, green: 0.9038077593, blue: 0.7417388558, alpha: 1)
        layer.cornerRadius = 5
        imageView?.layer.cornerRadius = 5
        layer.shadowRadius = 9
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 2, height: 5)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
