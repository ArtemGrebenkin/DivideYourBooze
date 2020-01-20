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
    private var plusMemberButton = MemberButton()
    private var plusStackView = MemberStackView()
    
    private var mainStackView: UIStackView = {
        var main = UIStackView()
        main.translatesAutoresizingMaskIntoConstraints = false
        main.axis = .vertical
        main.alignment = .center
        main.spacing = 5
        main.distribution = .fillEqually
        return main
    }()
    
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
        galleryCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        galleryCollectionView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        galleryCollectionView.setDefaultCell(cells: ItemModel.fetchItem())
        
        plusMemberButton.addTarget(self, action: #selector(plusButtonAction), for: .touchUpInside)
        
        rearrangeMainStackView()
        
        view.addSubview(mainStackView)
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        //mainStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(visualEffectView)
        visualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        visualEffectView.alpha = 0
    }
    
    @objc func plusButtonAction(sender: UIButton!) {
        
        view.addSubview(popUpWindow)
        popUpWindow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popUpWindow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true
        popUpWindow.heightAnchor.constraint(equalToConstant: 450).isActive = true
        popUpWindow.widthAnchor.constraint(equalToConstant: 300).isActive = true
        popUpWindow.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        popUpWindow.alpha = 0
        
        UIView.animate(withDuration: 0.2) {
            self.visualEffectView.alpha = 0.5
            self.popUpWindow.alpha = 1
            self.popUpWindow.transform = CGAffineTransform.identity
        }
    }
    
    func newMember(male: Bool) {
        var member = MemberModel(male: male)
        member.setDefaultPerson()
        member.male = male
        members.append(member)
        self.rearrangeMainStackView()
      
    }
    
    private func rearrangeMainStackView() {
        //clear all stack views
        for view in mainStackView.subviews {
            //print("clear all stack views")
            mainStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        let manager = RowStackViewManager()
        manager.members = members
        manager.plusButton = plusMemberButton
        let rowStackViews = manager.makeStackViewsArray()
        //fill main vertical stack
        for stackV in rowStackViews {
            //print("fill main vertical stack")
            mainStackView.addArrangedSubview(stackV)
        }
    }
}

extension DividerVC: PopUpDelegate {
    func handleMale() {
        UIView.animate(withDuration: 0.2, animations: {
            self.deBlurWindow()
            self.newMember(male: true)
        }) { (_) in
            self.popUpWindow.removeFromSuperview()
        }
    }
    
    func handleFemale() {
        UIView.animate(withDuration: 0.2, animations: {
            self.deBlurWindow()
            self.newMember(male: false)
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
