//
//  MemberModel.swift
//  DivideYourBooze
//
//  Created by Artem Grebenkin on 12/9/19.
//  Copyright © 2019 Artem Grebenkin. All rights reserved.
//

import UIKit

struct MemberModel {
    var name = "no name"
    var avatar = UIImage.DefaultMemberImage.yellow
    var debt: Decimal = 0
    var color = UIColor.ColorMember.yellow
}

extension UIColor {
  struct ColorMember {
    static var yellow: UIColor { return #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) }
    static var pink: UIColor { return #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1) }
    static var blue: UIColor { return #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1) }
    static var grey: UIColor { return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) }
  }
}

extension UIImage {
  struct DefaultMemberImage {
    static var yellow: UIImage { return #imageLiteral(resourceName: "PersonYellow") }
    static var pink: UIImage { return #imageLiteral(resourceName: "PersonPink") }
    static var blue: UIImage { return #imageLiteral(resourceName: "PersonBlue") }
    static var grey: UIImage { return #imageLiteral(resourceName: "PersonGray") }
  }
}
