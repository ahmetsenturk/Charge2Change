//
//  AchievementsOverview.swift
//  Charge2Change
//
//  Created by Ahmet Senturk on 18.07.23.
//

import SwiftUI

struct AchievementsOverview: View {
    @State private var selectedAchievement: AchievementModel? = nil
    var achievements = AchievementList.mockAchievements()
    
    var body: some View {
        NavigationView {
            List(achievements.achievements) { achievement in
                Button(action: {
                    selectedAchievement = achievement
                }) {
                    AchievementChipView(achievement: achievement)
                }
            }
            .navigationBarTitle("Achievements")
            .sheet(item: $selectedAchievement) { achievement in
                AchievementDetailView(achievement: achievement)
            }
        }
    }
}

struct AchievementsOverview_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsOverview()
    }
}

