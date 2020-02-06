//
//  MemderStackView.swift
//  DivideYourBooze
//
//  Created by Artem Grebenkin on 12/15/19.
//  Copyright © 2019 Artem Grebenkin. All rights reserved.
//

import UIKit

class MemberStackView: UIStackView {
    
    var member: MemberModel?
    var nameLabel: MainLabel?
    var debtLabel: MainLabel?
    var avatarButton: MemberButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        alignment = .center
        distribution = .fill
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
