//
//  RowStackViewManager.swift
//  DivideYourBooze
//
//  Created by Artem Grebenkin on 1/2/20.
//  Copyright © 2020 Artem Grebenkin. All rights reserved.
//

import UIKit

class RowStackViewManager {
    
    static let shared = RowStackViewManager()
    
    var members: [MemberModel]?
    var plusButton: MemberButton?
    
    func getScreenSize() -> (height: CGFloat, width: CGFloat) {
        let height = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width
        return (height, width)
    }
    
    func makeStackViewsArray() -> [UIStackView] {
        
        let screenWidth = Int(getScreenSize().width)
        let buttonWidth = Int(MemberButton.width + 20)
        let buttonInRow = screenWidth / buttonWidth
        print("buttonInRow \(buttonInRow)")
        
        let screenHeight = Int(getScreenSize().height - 250)
        let buttonHeight = Int(MemberButton.height + 20)
        let buttonInColum = screenHeight / buttonHeight
        print("buttonInColum \(buttonInColum)")
        
        
        
        var arraySV = [RowStackViews]()
        
        let rowStack = RowStackViews()
        guard let members = members else {return arraySV}
        for (index, member) in members.enumerated() {
            rowStack.addArrangedSubview(createMemberStackView(member: member))
            if index % buttonInRow == 0 && index != 0 {
                arraySV.append(rowStack)
                rowStack.deleteAllViews()
            }
            
        }
        
        let plusButtonSV = MemberStackView()
        guard let plusButton = plusButton else {return arraySV}
        plusButtonSV.addArrangedSubview(plusButton)
        rowStack.addArrangedSubview(plusButtonSV)
        arraySV.append(rowStack)
        
        return arraySV
    }
    
    private func createMemberStackView(member: MemberModel) -> MemberStackView {
        let button = MemberButton()
        button.setImage(member.avatar, for: .normal)
        
        let nameLabel = UILabel()
        nameLabel.text = member.name
        nameLabel.font = .systemFont(ofSize: 15)
        nameLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        let debtLabel = UILabel()
        debtLabel.text = String(member.debt)
        debtLabel.font = .systemFont(ofSize: 15)
        debtLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        let memberSV = MemberStackView()
        memberSV.addArrangedSubview(button)
        memberSV.addArrangedSubview(nameLabel)
        memberSV.addArrangedSubview(debtLabel)
        return memberSV
    }
    
//    init(members: [MemberModel], plusButton: MemberButton){
//        self.members = members
//        self.plusButton = plusButton
//    }
}
