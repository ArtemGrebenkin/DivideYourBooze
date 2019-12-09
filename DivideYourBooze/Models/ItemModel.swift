//
//  ItemModel.swift
//  DivideYourBooze
//
//  Created by Artem Grebenkin on 11/28/19.
//  Copyright © 2019 Artem Grebenkin. All rights reserved.
//

import UIKit

struct ItemModel {
    var mainImage: UIImage?
    var itemName: String
    var itemCost: Int

    
    static func fetchItem() -> [ItemModel] {
        var items = [ItemModel]()

        let stringNames = ["vineRed", "bardecueRus", "beerLight", "beerSnack", "champagne", "cognac", "cotailRed", "crisps", "juiceRed", "pizza", "vodka", "whiskey", "plusButton"]
        
        for name in stringNames {
            let item = ItemModel(mainImage: UIImage(named: name), itemName: name, itemCost: 0)
            items.append(item)
        }
        
        return items
    }
    
}
