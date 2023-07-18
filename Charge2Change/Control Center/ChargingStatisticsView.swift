//
//  ChargingStatisticsView.swift
//  Charge2Change
//
//  Created by Ahmet Senturk on 18.07.23.
//

import SwiftUI

struct ChargingStatisticsView: View {
    @State private var selectedBreakdown: Breakdown = .today
    
    enum Breakdown: String, CaseIterable {
        case today = "Today"
        case lastSevenDays = "Last 7 Days"
        case lastMonth = "Last Month"
        
        var hoursCharged: Int {
            switch self {
            case .today:
                return 4
            case .lastSevenDays:
                return 28
            case .lastMonth:
                return 120
            }
        }
        
        var kWhReturned: Double {
            switch self {
            case .today:
                return 12.5
            case .lastSevenDays:
                return 85.2
            case .lastMonth:
                return 340.9
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            HStack {
                Text("Charging Analytics")
                    .font(.headline)
                Spacer()
                Picker(selection: $selectedBreakdown, label: Text("")) {
                    ForEach(Breakdown.allCases, id: \.self) { breakdown in
                        Text(breakdown.rawValue)
                            .tag(breakdown)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 200)
            }
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Hours Charged:")
                        .font(.headline)
                    
                    Text("\(selectedBreakdown.hoursCharged) hours")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                }
                Spacer()
                VStack(alignment: .leading, spacing: 8) {
                    Text("kWh Returned:")
                        .font(.headline)
                    
                    Text(String(format: "%.1f kWh", selectedBreakdown.kWhReturned))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                }
            }
        }
        .padding()
        .cornerRadius(30)
        .background(Color(.systemGray6))
        .padding()
        .cornerRadius(5) // Add corner radius for a rounded appearance
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2) // Add a subtle shadow
    }
}

struct ChargingStatisticsView_Preview: PreviewProvider {
    static var previews: some View {
        ChargingStatisticsView()
    }
}

