//
//  AchievementList.swift
//  Charge2Change
//
//  Created by Ahmet Senturk on 18.07.23.
//

import Foundation

class AchievementList: ObservableObject {
    var achievements: [AchievementModel]
    
    init(achievements: [AchievementModel]) {
        self.achievements = achievements
    }
    
    func addAchievement(_ achievement: AchievementModel) {
        achievements.append(achievement)
    }
    
    func removeAchievement(at index: Int) {
        achievements.remove(at: index)
    }
    
    static func mockAchievements() -> AchievementList {
        let a1 = AchievementModel(name: "Community Contributor", description: "Refer a certain number of friends or family members to join and actively use V2G bidirectional charging.", coins: 10, icon: "person.fill.checkmark")
        let a2 = AchievementModel(name: "Charging Marathon", description: "Complete a certain number of V2G bidirectional charging sessions within a given time period.", coins: 20, icon: "figure.run")
        let a3 = AchievementModel(name: "Grid Stabilizer", description: "Help stabilize the local power grid by contributing a certain amount of power back to the grid during times of high demand or emergencies.", coins: 30, icon: "water.waves")
        let a4 = AchievementModel(name: "Grid Ambassador", description: "Share your V2G charging experience and knowledge on social media platforms, reaching a specific number of followers or engagements.", coins: 10, icon: "music.mic")
        let a5 = AchievementModel(name: "Sustainable Innovator", description: "Help stabilize the local power grid by contributing a certain amount of power back to the grid during times of high demand or emergencies.", coins: 100, icon: "bonjour")
        let a6 = AchievementModel(name: "Demand Response Hero", description: "Actively respond to grid operator requests for energy reduction during peak periods by leveraging V2G bidirectional charging.", coins: 40, icon: "sos.circle")
        
        let achievementModel = AchievementList(achievements: [a1, a2, a3, a4, a5, a6])
        return achievementModel
    }
}
