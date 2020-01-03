//
//  MemberModel.swift
//  DivideYourBooze
//
//  Created by Artem Grebenkin on 12/9/19.
//  Copyright © 2019 Artem Grebenkin. All rights reserved.
//

import UIKit

struct MemberModel {
    var name: String?
    var avatar: UIImage?
    var debt = 0
    var male: Bool
    
    mutating func setDefaultPerson() {
        let men = ["Artem", "Alexandr", "Alexey", "Igor", "Kiril", "Konstantin", "Oleg", "Pele", "Sergey", "Timur", "Vadim", "Victor"]
        let women = ["Olga", "Elena", "Genia", "Natasha", "Svetlana", "Tania", "Vera"]
        
        let avatars = (male ? men : women)
        if let name = avatars.randomElement() {
            self.avatar = UIImage(named: name)
            self.name = name
            
        }
        
    }
    
    init(male: Bool) {
        self.male = male
    }
}

