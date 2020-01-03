//
//  PopUp.swift
//  DivideYourBooze
//
//  Created by Artem Grebenkin on 12/18/19.
//  Copyright © 2019 Artem Grebenkin. All rights reserved.
//

import UIKit

protocol PopUpDelegate {
    func handleMale()
    func handleFemale()
    func handleDismissPopUp()
}

class PopUp: UIView {
    
    // MARK: - Properties
    var delegate: PopUpDelegate?
    
    let buttonMale: MenuButton = {
        let button = MenuButton(title: "Male", color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
        button.addTarget(self, action: #selector(handleMale), for: .touchUpInside)
        return button
    }()
    
    let buttonFemale: MenuButton = {
        let button = MenuButton(title: "Female", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        button.addTarget(self, action: #selector(handleFemale), for: .touchUpInside)
        return button
    }()
    
    let buttonDismiss: MenuButton = {
        let button = MenuButton(title: "Dismiss", color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        button.addTarget(self, action: #selector(handleDismissPopUp), for: .touchUpInside)
        return button
    }()
    
    let textFieldName: InputField = {
        let flexButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace , target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        let field = InputField(keybType: .namePhonePad, placeholderText: "Enter name", barButtons: [flexButton, doneButton])
        return field
    }()

    let textFieldDebt: InputField = {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        let flexButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace , target: nil, action: nil)
        let plusMinusButton = UIBarButtonItem(title: "+/-", style: .plain, target: nil, action: #selector(plusMinusPressed))
        let field = InputField(keybType: .decimalPad, placeholderText: "Enter start debt", barButtons: [plusMinusButton, flexButton, doneButton])
        return field
    }()
    
    //let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped(gestureRecognizer:)))
    //addGestureRecognizer(tapGesture)
    
    // MARK: - Selectors
    
    @objc func handleMale() {
        delegate?.handleMale()
    }
    @objc func handleFemale() {
        delegate?.handleFemale()
    }
    @objc func handleDismissPopUp() {
        delegate?.handleDismissPopUp()
    }
    
    @objc func donePressed() {
        endEditing(true)
    }

    @objc func plusMinusPressed() {
        print("plusMinusPressed")
    }
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        layer.shadowRadius = 18
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 5, height: 8)
        
        addSubview(textFieldName)
        textFieldName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textFieldName.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20).isActive = true
        textFieldName.delegate = self
        
        addSubview(textFieldDebt)
        textFieldDebt.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textFieldDebt.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 30).isActive = true
        textFieldDebt.delegate = self
        
        addSubview(buttonMale)
        buttonMale.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buttonMale.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 80).isActive = true
        
        addSubview(buttonFemale)
        buttonFemale.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buttonFemale.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 130).isActive = true
        
        addSubview(buttonDismiss)
        buttonDismiss.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buttonDismiss.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 180).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PopUp: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        endEditing(true)
    }
    
    func hideKeyboar() {
        textFieldDebt.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboar()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
}
