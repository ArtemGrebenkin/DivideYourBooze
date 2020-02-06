//
//  PopUp.swift
//  DivideYourBooze
//
//  Created by Artem Grebenkin on 12/18/19.
//  Copyright © 2019 Artem Grebenkin. All rights reserved.
//

import UIKit

protocol PopUpDelegate {
    func handleEditPopUp()
    func handleDismissPopUp()
}

class PopUp: UIView {
    
    // MARK: - Properties
    var delegate: PopUpDelegate?
    
    let buttonYellow: MemberButton = {
        let button = MemberButton()
        button.setImage(#imageLiteral(resourceName: "PersonYellow"), for: .normal)
        //button.
        button.addTarget(self, action: #selector(editMember), for: .touchUpInside)
        return button
    }()
    
    let buttonPink: MemberButton = {
        let button = MemberButton()
        button.setImage(#imageLiteral(resourceName: "PersonPink"), for: .normal)
        button.addTarget(self, action: #selector(editMember), for: .touchUpInside)
        return button
    }()
    
    let buttonBlue: MemberButton = {
        let button = MemberButton()
        button.setImage(#imageLiteral(resourceName: "PersonBlue"), for: .normal)
        button.addTarget(self, action: #selector(editMember), for: .touchUpInside)
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
    
    @objc func editMember() {
        delegate?.handleEditPopUp()
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
        
        let buttonsStack = RowStackViews()
        buttonsStack.addArrangedSubview(buttonBlue)
        buttonsStack.addArrangedSubview(buttonYellow)
        buttonsStack.addArrangedSubview(buttonPink)
        
        let verticalStack = UIStackView()
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.alignment = .center
        verticalStack.spacing = 20
        verticalStack.distribution = .fill
        textFieldName.delegate = self
        textFieldDebt.delegate = self
        verticalStack.addArrangedSubview(textFieldName)
        verticalStack.addArrangedSubview(textFieldDebt)
        verticalStack.addArrangedSubview(buttonsStack)
        verticalStack.addArrangedSubview(buttonDismiss)
        addSubview(verticalStack)
        verticalStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        verticalStack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

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
