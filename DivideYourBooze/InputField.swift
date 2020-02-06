//
//  InputField.swift
//  DivideYourBooze
//
//  Created by Artem Grebenkin on 12/31/19.
//  Copyright © 2019 Artem Grebenkin. All rights reserved.
//

import UIKit

class InputField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: 30, height: 170)
        translatesAutoresizingMaskIntoConstraints = false
        borderStyle = .roundedRect
        heightAnchor.constraint(equalToConstant: 30).isActive = true
        widthAnchor.constraint(equalToConstant: 170).isActive = true
        clearButtonMode = .whileEditing
        textAlignment = .center
    }
    
    convenience init(keybType: UIKeyboardType, placeholderText: String, barButtons: [UIBarButtonItem]) {
        self.init()
        placeholder = placeholderText
        keyboardType = keybType
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.setItems(barButtons, animated: false)
        inputAccessoryView = toolBar
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
