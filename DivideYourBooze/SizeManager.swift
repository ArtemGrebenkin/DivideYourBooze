//
//  SizeManager.swift
//  DivideYourBooze
//
//  Created by Artem Grebenkin on 1/25/20.
//  Copyright © 2020 Artem Grebenkin. All rights reserved.
//

import UIKit

class SizeManager {
    
    static let shared = SizeManager()
    
    let screenSize = UIScreen.main.bounds
    let screenSizeWidthInt: Int
    let screenSizeHeightInt: Int
    let space: CGFloat = 20
    
    init() {
        screenSizeWidthInt = Int(screenSize.width)
        screenSizeHeightInt = Int(screenSize.height)
        print("W: \(screenSize.width), H: \(screenSize.height)")
    }
    
//    func numbersButtonsInSet() -> (inRow: Int, inColumn: Int)  {
//
//        let screenWidth = Int(screenSize.width)
//        let buttonWidth = Int(MemberButton.widthPlusSpace)
//        let inRow = screenWidth / buttonWidth
//
//        let screenHeight = Int(screenSize.height - 250)
//        let buttonHeight = Int(MemberButton.heightPlusSpace)
//        let inColumn = screenHeight / buttonHeight
//        print("buttonInColum \(inColumn), buttonInRow \(inRow)")
//
//        return (inRow, inColumn)
}
