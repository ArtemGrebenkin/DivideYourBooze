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
        //print("buttonInColum \(buttonInColum)")
        
        
        
        var arrayRowStack = [RowStackViews]()
        
        let rowStack = RowStackViews()
   
        
        guard let members = members else {return arrayRowStack}
        for (index, member) in members.enumerated() {
            rowStack.addArrangedSubview(createMemberStackView(member: member))
            print("ind = \(index), mems = \(members.count)")
            if index % buttonInRow == 0 && index != 0 {
                let row = RowStackViews()
                
                for view in rowStack.subviews {
                    
                    row.addSubview(view)
                }
                arrayRowStack.append(row)
                print("arrayRowStack1 = \(arrayRowStack.count)")
                rowStack.deleteAllSubViews()
            }
        }
        
        let plusButtonSV = MemberStackView()
        guard let plus = plusButton else {return arrayRowStack}
        plusButtonSV.addArrangedSubview(plus)
        rowStack.addArrangedSubview(plusButtonSV)
        arrayRowStack.append(rowStack)
        print("arrayRowStack2 = \(arrayRowStack.count)")
        return arrayRowStack
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
