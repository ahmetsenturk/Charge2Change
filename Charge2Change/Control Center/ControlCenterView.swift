//
//  ControlCenterView.swift
//  Charge2Change
//
//  Created by Ahmet Senturk on 18.07.23.
//

import SwiftUI

struct ControlCenterView: View {
    @State private var sliderValue: Double = 50
    @State private var batteryHealth: Double = 80
    @State private var breakdownType: BreakdownType = .today
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Currently:")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Charging").font(.title2).fontWeight(.bold).foregroundColor(Color.green)
            }
            ChargeView(chargePercentage: 75)
                .padding(.vertical, -40)
            Group {
                Text("1 hour to complete")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.vertical, -30)
                HStack {
                    Text("Min capacity level")
                        .font(.headline)
                        .fontWeight(.bold)
                    Slider(value: $sliderValue, in: 0...100, step: 1)
                    Text("\(Int(sliderValue))%")
                        .font(.headline)
                        .fontWeight(.bold)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, -30)
            ChargingStatisticsView()
                .padding(.vertical, 30)
            BatteryHealthView()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

enum BreakdownType: String, CaseIterable {
    case today = "Today"
    case last7Days = "Last 7 Days"
    case lastMonth = "Last Month"
    
    var hoursCharged: Int {
        switch self {
        case .today:
            return 4
        case .last7Days:
            return 28
        case .lastMonth:
            return 120
        }
    }
    
    var kWhReturned: Double {
        switch self {
        case .today:
            return 12.5
        case .last7Days:
            return 85.2
        case .lastMonth:
            return 340.9
        }
    }
    
}

struct ControlCenterView_Previews: PreviewProvider {
    static var previews: some View {
        ControlCenterView()
    }
}

