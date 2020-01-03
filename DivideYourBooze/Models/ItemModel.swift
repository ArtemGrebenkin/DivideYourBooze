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

        let stringNames = ["drink_0_juice", "drink_beer_light", "drink_vine_red", "drink_champagne", "drink_cotail_red", "drink_hot_cognac", "drink_hot_vodka", "drink_hot_whiskey", "eat_snack_crisps", "eat_snack_snack", "eat_dough_pizza", "eat_meat_bardecueRus", "whitePlus"]
        
        for name in stringNames {
            let item = ItemModel(mainImage: UIImage(named: name), itemName: name, itemCost: 0)
            items.append(item)
        }
        
        return items
    }
    
}
