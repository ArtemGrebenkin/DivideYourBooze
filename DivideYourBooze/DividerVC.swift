//
//  DividerVC.swift
//  DivideYourBooze
//
//  Created by Artem Grebenkin on 11/14/19.
//  Copyright © 2019 Artem Grebenkin. All rights reserved.
//
import UIKit

class DividerVC: UIViewController {
    
    private var galleryCollectionView = GalleryCollectionView()
    private var memberButtons = [MemberStackView]()
    let sizeManager = SizeManager()
    var members = [MemberModel]()
    lazy var popUpWindow: PopUp = {
        let view = PopUp()
        view.delegate = self
        return view
    }()
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(galleryCollectionView)
        galleryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        galleryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        galleryCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: sizeManager.space).isActive = true
        galleryCollectionView.heightAnchor.constraint(equalToConstant: galleryCollectionView.height).isActive = true
        
        galleryCollectionView.setDefaultCell(cells: ItemModel.fetchItem())
        
        let savedDataEmpty = true
        setInactiveButtons(startFromRow: 1, startFromColumn: 1)
        if savedDataEmpty {
            var firstMember = MemberModel()
            firstMember.name = "Me"
            firstMember.avatar = UIImage.DefaultMemberImage.yellow
            firstMember.color = UIColor.ColorMember.yellow
            members.append(firstMember)
            activateMemberButtonForEach(members)
        }
        
        view.addSubview(visualEffectView)
        visualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        visualEffectView.alpha = 0
    }
    
    @objc func buttonAction(sender: MemberButton) {
        if sender.activited {
            //set new member with dialog
            view.addSubview(popUpWindow)
            popUpWindow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            popUpWindow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
            popUpWindow.heightAnchor.constraint(equalToConstant: 350).isActive = true
            popUpWindow.widthAnchor.constraint(equalToConstant: 250).isActive = true
            popUpWindow.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            popUpWindow.alpha = 0
            
            UIView.animate(withDuration: 0.2) {
                self.visualEffectView.alpha = 0.5
                self.popUpWindow.alpha = 1
                self.popUpWindow.transform = CGAffineTransform.identity
            }
        } else {
            //set new member without dialog (fast)
            sender.activited = true
            self.newMember()
        }
    }
    
    func newMember() {
        let member = MemberModel()
        members.append(member)
        activateMemberButtonForEach(members)
    }
    
    func editMember() {
        
    }
    
    private func setInactiveButtons(startFromRow: Int, startFromColumn: Int){
        let bm = ButtonManager()
        let buttonsInRow = bm.buttonsSet().inRow
        let buttonsInColumn = bm.buttonsSet().inColumn
        var tag = 0
        for row in (startFromRow...buttonsInColumn){
            let spaceToTop = bm.defineSpaceFor(row: row)
            for column in (startFromColumn...buttonsInRow){
                let button = MemberButton()
                tag += 1
                button.tag = tag
                button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
                //
                let memberStack = bm.createMemberStackView(button: button)
                memberButtons.append(memberStack)
                view.addSubview(memberStack)
                let spaceToRight = bm.defineSpaceFor(column: column)
                memberStack.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: spaceToRight).isActive = true
                memberStack.bottomAnchor.constraint(equalTo: galleryCollectionView.bottomAnchor, constant: spaceToTop).isActive = true
            }
        }
    }
    
    private func activateMemberButtonForEach(_ members: [MemberModel]) {
        for (index, person) in members.enumerated() {
            let mb = memberButtons[index]
            mb.member = person
            mb.nameLabel?.text = person.name
            mb.debtLabel?.text = person.debt.description
            mb.avatarButton?.setImage(person.avatar, for: .normal)
        }
    }
}

extension DividerVC: PopUpDelegate {
    func handleEditPopUp() {
        UIView.animate(withDuration: 0.2, animations: {
            self.deBlurWindow()
            self.editMember()
        }) { (_) in
            self.popUpWindow.removeFromSuperview()
        }
    }
    
    func handleDismissPopUp() {
        UIView.animate(withDuration: 0.2, animations: {
            self.deBlurWindow()
        }) { (_) in
            self.popUpWindow.removeFromSuperview()
        }
    }
    
    private func deBlurWindow() {
        self.visualEffectView.alpha = 0
        self.popUpWindow.alpha = 0
        self.popUpWindow.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
    }
}
