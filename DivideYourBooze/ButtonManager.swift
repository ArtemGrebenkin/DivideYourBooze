//
//  RowStackViewManager.swift
//  DivideYourBooze
//
//  Created by Artem Grebenkin on 1/2/20.
//  Copyright © 2020 Artem Grebenkin. All rights reserved.
//

import UIKit

class ButtonManager {
    
    static let shared = ButtonManager()
    
    //var members: [MemberModel]?
    //var plusButton: MemberButton?
    let screenSize = SizeManager.shared.screenSize
    
    
    func buttonsSet() -> (inRow: Int, inColumn: Int, spaceInRow: Int, spaceInColumn: Int)  {
        
        let screenWidth = Int(screenSize.width)
        let screenHeight = Int(screenSize.height * 0.70)
        
        let buttonWidth = Int(MemberButton.width)
        let buttonHeight = Int(MemberButton.height)
        
        var spaceInRow = 20
        var spaceInColumn = 40
        
        let inRow = screenWidth / (buttonWidth + spaceInRow)
        let inColumn = screenHeight / (buttonHeight + spaceInColumn)
        
        let freeSpaceInRow = screenWidth - inRow * buttonWidth
        let freeSpaceInColumn = screenHeight - inColumn * buttonHeight
        
        spaceInRow = freeSpaceInRow / (inRow + 1)
        spaceInColumn = freeSpaceInColumn / (inColumn + 1)
        
        print("buttonInColum \(inColumn), buttonInRow \(inRow), spaceInRow \(spaceInRow), spaceInColumn \(spaceInColumn)")
        return (inRow, inColumn, spaceInRow, spaceInColumn)
    }
    
    func createMemberStackView(button: MemberButton) -> MemberStackView {
        let nameLabel = MainLabel()
        nameLabel.text = "no name"
        
        let debtLabel = MainLabel()
        debtLabel.text = "0"
        
        let memberStack = MemberStackView()
        memberStack.nameLabel = nameLabel
        memberStack.debtLabel = debtLabel
        memberStack.avatarButton = button
        
        memberStack.addArrangedSubview(button)
        memberStack.addArrangedSubview(debtLabel)
        memberStack.addArrangedSubview(nameLabel)
        return memberStack
    }
    
    func defineSpaceFor(row: Int = 0, column: Int = 0) -> CGFloat {
        let verticalSpaceBetweenButtons = CGFloat(buttonsSet().spaceInColumn)
        let horizontalSpaceBetweenButtons = CGFloat(buttonsSet().spaceInRow)
        
        if row == 0 {
            return CGFloat(column) * (MemberButton.width + horizontalSpaceBetweenButtons)
        } else {
            return CGFloat(row) * (MemberButton.height + verticalSpaceBetweenButtons)
        }
    }
}
