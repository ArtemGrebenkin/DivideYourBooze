//
//  MemberButton.swift
//  DivideYourBooze
//
//  Created by Artem Grebenkin on 12/5/19.
//  Copyright © 2019 Artem Grebenkin. All rights reserved.
//
import UIKit

class MemberButton: UIButton {
    
    static let height: CGFloat = 60
    static let width: CGFloat = 60
    var activited = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init() {
        super.init(frame: .zero)
        setImage(UIImage.DefaultMemberImage.grey, for: .normal)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = 30
        imageView?.contentMode = .scaleAspectFit
        layer.shadowRadius = 9
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 2, height: 5)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        widthAnchor.constraint(equalToConstant: 60).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


