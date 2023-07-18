//
//  AchievementChipView.swift
//  Charge2Change
//
//  Created by Ahmet Senturk on 18.07.23.
//

import SwiftUI

struct AchievementChipView: View {
    var achievement: AchievementModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Group {
                HStack(alignment: .center, spacing: 16) {
                    Image(systemName: achievement.icon)
                        .foregroundColor(Color.blue)
                    Text(achievement.name).font(Font.system(size: 22, weight: .semibold))
                    Spacer()
                }
                //Text(achievement.description).foregroundColor(.secondary)
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "centsign.circle")
                        .foregroundColor(Color.orange)
                    Text("\(achievement.coins)").foregroundColor(.orange)
                }
            }
        }
    }
}

struct AchievementChipView_Previews: PreviewProvider {
    static var achievement = AchievementModel(name: "Community Contributor", description: "Refer a certain number of friends or family members to join and actively use V2G bidirectional charging.", coins: 10, icon: "person.fill.checkmark")
    static var previews: some View {
        AchievementChipView(achievement: achievement)
    }
}


