//
//  StoreModel.swift
//  Charge2Change
//
//  Created by Ahmet Senturk on 18.07.23.
//

import Foundation

class StoreModel: Identifiable {
    var description: String
    var coins: Int
    var icon: String
    var background: String
    
    init(description: String, coins: Int, icon: String, background: String) {
        self.description = description
        self.coins = coins
        self.icon = icon
        self.background = background
    }
}
