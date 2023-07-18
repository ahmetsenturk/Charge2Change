//
//  PodiumView.swift
//  Charge2Change
//
//  Created by Ahmet Senturk on 18.07.23.
//

import SwiftUI

struct Player: Identifiable {
    let id = UUID()
    let name: String
    let score: Int
}

struct LeaderboardRow: View {
    let player: Player
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text(player.name)
                    .font(.headline)
                Spacer()
                Text("\(player.score) points")
                    .font(.subheadline)
            }
            .padding()
        }
        .padding()
        .frame(height: 40)
        .background(Color(.systemGray6))
        .cornerRadius(5) // Add corner radius for a rounded appearance
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2) // Add a subtle shadow
    }
}


struct LeaderboardView: View {
    let playersWeekly: [Player]
    let playersAllTime: [Player]
    @State private var selectedDataType = 0
    
    var selectedData: [Player] {
        switch selectedDataType {
        case 0: return playersWeekly
        case 1: return playersAllTime
        default: return []
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image(systemName: "trophy")
                    .foregroundColor(Color.red)
                Text("Leaderboard")
            }
            .font(.title)
            .fontWeight(.bold)
            .padding()
            Picker("Data Type", selection: $selectedDataType) {
                Text("Weekly").tag(0)
                Text("All Time").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            let sortedPlayers = selectedData.sorted { $0.score > $1.score }
            if sortedPlayers.count >= 3 {
                PodiumView(players: Array(sortedPlayers.prefix(3)))
            }
            
            ForEach(sortedPlayers) { player in
                LeaderboardRow(player: player)
            }
            Spacer()
        }
    }
}

struct PodiumView: View {
    let players: [Player]
    
    var body: some View {
        HStack(spacing: 10) {
            Spacer()
            
            ForEach(0..<3) { index in
                VStack {
                    Text("\(index == 0 ? 2 : (index == 1 ? 1 : 3))")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(getPodiumTextColor(index: index))
                        .padding(.bottom, 10)
                    
                    Spacer()
                        .frame(height: getPodiumHeight(index: index))
                    
                    if players.count > index {
                        let org_index = index == 0 ? 1 : (index == 1 ? 0 : 2)
                        
                        Text(players[org_index].name)
                            .font(.headline)
                            .foregroundColor(getPodiumTextColor(index: index))
                        
                        Text("\(players[org_index].score)")
                            .font(.subheadline)
                            .foregroundColor(getPodiumTextColor(index: index))
                            .padding(.bottom, 10)
                    }
                }
                .padding()
                .background(getPodiumBackgroundColor(index: index))
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: 0, y: 3)
            }
            
            Spacer()
        }
        .padding()
    }
    
    private func getPodiumBackgroundColor(index: Int) -> Color {
        switch index {
        case 0:
            return Color.red
        case 1:
            return Color.blue
        case 2:
            return Color.green
        default:
            return Color.secondary
        }
    }
    
    private func getPodiumTextColor(index: Int) -> Color {
        return index == 2 ? .primary : .white
    }
    
    private func getPodiumHeight(index: Int) -> CGFloat {
            let heights: [CGFloat] = [80, 100, 60]
            return heights[index]
        }
}


let samplePlayers = [
    Player(name: "John", score: 100),
    Player(name: "Lisa", score: 150),
    Player(name: "Jane", score: 75),
    Player(name: "Alice", score: 90),
    Player(name: "Mike", score: 120)
]

let samplePlayersAllTime = [
    Player(name: "John", score: 700),
    Player(name: "Lisa", score: 250),
    Player(name: "Jane", score: 800),
    Player(name: "Alice", score: 390),
    Player(name: "Mike", score: 150)
]

struct LeaderboardContentView: View {
    var body: some View {
        LeaderboardView(playersWeekly: samplePlayers, playersAllTime: samplePlayersAllTime)
    }
}
