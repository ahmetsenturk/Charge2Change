//
//  AchievementDetailView.swift
//  Charge2Change
//
//  Created by Ahmet Senturk on 18.07.23.
//

import SwiftUI

struct AchievementDetailView: View {
    var achievement: AchievementModel
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(achievement.name)) {
                    Text(achievement.description)
                }
            }
        }

    }
}

struct AchievementDetailView_Previews: PreviewProvider {
    static var achievement = AchievementModel(name: "Community Contributor", description: "Refer a certain number of friends or family members to join and actively use V2G bidirectional charging.", coins: 10, icon: "person.fill.checkmark")
    static var previews: some View {
        AchievementDetailView(achievement: achievement)
    }
}
