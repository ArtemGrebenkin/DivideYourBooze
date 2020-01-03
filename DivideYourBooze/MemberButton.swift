//
//  MemberButton.swift
//  DivideYourBooze
//
//  Created by Artem Grebenkin on 12/5/19.
//  Copyright © 2019 Artem Grebenkin. All rights reserved.
//
import UIKit

class MemberButton: UIButton {
    
    static let height: CGFloat = 60
    static let width: CGFloat = 60
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init() {
        super.init(frame: .zero)
        setImage(UIImage(named: "whitePlus"), for: .normal)
        self.frame = CGRect(x: 20, y: 350, width: 60, height: 60)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = 10
        imageView?.layer.cornerRadius = 10
        imageView?.contentMode = .scaleAspectFit
        layer.shadowRadius = 9
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 2, height: 5)
        //setTitle("add", for: .normal)
        
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        widthAnchor.constraint(equalToConstant: 60).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func shiftToRight() {
//        var x = Int(frame.minX)
//        var y = Int(frame.minY)
//        let point = CGPoint(x: x, y: y)
//            let size = CGSize(width: 60, height: 60)
//        if enoughtToRigth(from: point) {
//            x += 80
//        } else {
//            x = 20
//            y += 80
//        }
//            let newPoint = CGPoint(x: x, y: y)
//            frame = CGRect(origin: newPoint, size: size)
//
//    }
//
    func fetchDefaultImage() {
        let rnd = Int.random(in: 1..<3)
        let defaultImage = UIImage(named: String(rnd))
        setImage(defaultImage, for: .normal)
    }
    
//    private func enoughtToRigth(from startPoint: CGPoint) -> Bool {
//        startPoint.x + 60 + 20 + 60 + 20 <= UIScreen.main.bounds.width
//    }
}
