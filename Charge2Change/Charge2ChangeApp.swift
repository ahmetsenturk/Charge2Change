//
//  Charge2ChangeApp.swift
//  Charge2Change
//
//  Created by Ahmet Senturk on 18.07.23.
//

import SwiftUI

@main
struct Charge2ChangeApp: App {
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentViewNew()
                    .tabItem {
                        Label("Map", systemImage: "map")
                    }
                ControlCenterView()
                    .tabItem {
                        Label("Control Center", systemImage: "bolt.batteryblock")
                    }
                EarningsView()
                    .tabItem {
                        Label("Earnings", systemImage: "centsign.circle")
                    }
                HighlightSection(stores: StoreList.mockStores().stores)
                    .tabItem {
                        Label("Store", systemImage: "cart")
                    }
                AchievementsOverview()
                    .tabItem {
                        Label("Achievements", systemImage: "medal")
                    }
                LeaderboardContentView()
                    .tabItem {
                        Label("Leaderboard", systemImage: "trophy")
                    }
            }
            .background(.white)
            
        }
    }
}

