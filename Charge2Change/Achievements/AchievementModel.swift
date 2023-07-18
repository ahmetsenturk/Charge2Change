//
//  AchievementModel.swift
//  Charge2Change
//
//  Created by Ahmet Senturk on 18.07.23.
//

import Foundation

class AchievementModel: Identifiable {
    var name: String
    var description: String
    var coins: Int
    var icon: String
    
    init(name: String, description: String, coins: Int, icon: String) {
        self.name = name
        self.description = description
        self.coins = coins
        self.icon = icon
    }
}
