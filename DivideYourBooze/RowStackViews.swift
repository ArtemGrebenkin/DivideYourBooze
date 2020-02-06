//
//  RowStackViews.swift
//  DivideYourBooze
//
//  Created by Artem Grebenkin on 12/16/19.
//  Copyright © 2019 Artem Grebenkin. All rights reserved.
//

import UIKit

class RowStackViews: UIStackView {
    
//    func deleteAllSubViews() {
//        for view in subviews {
//            print("deleteAllViewsFromRowStackViews")
//            removeArrangedSubview(view)
//            view.removeFromSuperview()
//        }
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        alignment = .center
        spacing = 5
        distribution = .fillEqually
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
