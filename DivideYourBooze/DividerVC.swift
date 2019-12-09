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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(galleryCollectionView)
        galleryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        galleryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        galleryCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        galleryCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -600).isActive = true
        
        galleryCollectionView.setDefaultCell(cells: ItemModel.fetchItem())
        
        view.addSubview(plusMemberButton)
    
    }
    


}
