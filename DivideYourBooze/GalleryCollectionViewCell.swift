//
//  GalleryCollectionViewCell.swift
//  DivideYourBooze
//
//  Created by Artem Grebenkin on 11/28/19.
//  Copyright © 2019 Artem Grebenkin. All rights reserved.
//
import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "GalleryCollectionViewCell"
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        //imageView.image = UIImage(named: "beerLight.png")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let nameLabel: MainLabel = {
        let label = MainLabel()
        //label.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nameLabel.text = "beer light with fish"
        
        addSubview(mainImageView)
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(nameLabel)
//        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        nameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        //nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        //nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 60).isActive = true
        nameLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //self.layer.cornerRadius = 10
        //self.layer.shadowRadius = 9
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 8)
        
        self.clipsToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
