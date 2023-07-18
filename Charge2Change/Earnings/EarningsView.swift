//
//  EarningsView.swift
//  Charge2Change
//
//  Created by Ahmet Senturk on 18.07.23.
//

import SwiftUI

struct DataPoint {
    let date: Date
    let value: Double
}

struct DataModelNew {
    let earnings: [DataPoint]
    let kilowatts: [DataPoint]
}

struct EarningsView: View {
    @State private var selectedDataType = 0
    @State private var selectedTimeFrame = 0

    let dataModel = DataModelNew(
        earnings: [
            DataPoint(date: Date(timeIntervalSince1970: 1688222983), value: 12.0),
            DataPoint(date: Date(timeIntervalSince1970: 1688309383), value: 8.0),
            DataPoint(date: Date(timeIntervalSince1970: 1688395783), value: 15.0),
            DataPoint(date: Date(timeIntervalSince1970: 1688482183), value: 20.0),
            DataPoint(date: Date(timeIntervalSince1970: 1688568583), value: 9.0),
            DataPoint(date: Date(timeIntervalSince1970: 1688654983), value: 13.0)
        ],
        kilowatts: [
            DataPoint(date: Date(timeIntervalSince1970: 1688222983), value: 350.0),
            DataPoint(date: Date(timeIntervalSince1970: 1688309383), value: 280.0),
            DataPoint(date: Date(timeIntervalSince1970: 1688395783), value: 410.0),
            DataPoint(date: Date(timeIntervalSince1970: 1688482183), value: 380.0),
            DataPoint(date: Date(timeIntervalSince1970: 1688568583), value: 300.0),
            DataPoint(date: Date(timeIntervalSince1970: 1688654983), value: 320.0)
        ]
    )

    var selectedData: [DataPoint] {
        switch selectedDataType {
        case 0: return dataModel.earnings
        case 1: return dataModel.kilowatts
        default: return []
        }
    }

    var xLabels: [String] {
        switch selectedTimeFrame {
        case 0: return selectedData.map { formatDate($0.date) } // Weekly
        case 1: return Array(Set(selectedData.map { formatMonth($0.date) })) // Monthly
        default: return []
        }
    }

    var aggregatedData: [Double] {
        switch selectedTimeFrame {
        case 0: return selectedData.map { $0.value } // Weekly
        case 1: return aggregateMonthlyData() // Monthly
        default: return []
        }
    }

    var timeFrames = ["Weekly", "Monthly"]

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Earnings")
                    Image(systemName: "dollarsign")
                        .foregroundColor(Color.yellow)
                    Spacer()
                }
                .font(.title)
                .fontWeight(.bold)
                .padding()
                
                HStack {
                    Picker("Data Type", selection: $selectedDataType) {
                        Text("Coins").tag(0)
                        Text("Kilowatts").tag(1)
                    }
                    Picker("Time Frame", selection: $selectedTimeFrame) {
                        ForEach(0..<timeFrames.count) { index in
                            Text(timeFrames[index]).tag(index)
                        }
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                BarChartViewNew(data: aggregatedData, xLabels: xLabels, maxDataValue: aggregatedData.max() ?? 0)
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("You are great, you earned 77 coins this month!")
                    Text("Keep this tempo and earn 230 coins next month!")
                }
                .font(.italic(.subheadline)())
                .padding()
                HStack {
                    Text("Eco Impact")
                    Image(systemName: "tree")
                        .foregroundColor(Color.green)
                    Spacer()
                }
                .font(.title)
                .fontWeight(.bold)
                .padding()
                EcoImpactView(data: [8, 7], labels: ["This Month", "Previous"])
                Spacer()
            }
            .padding()
        }
    }

    func aggregateMonthlyData() -> [Double] {
        let groupedData = Dictionary(grouping: selectedData) { formatMonth($0.date) }
        return groupedData
            .values
            .sorted(by: { $0.first!.date < $1.first!.date })
            .map { $0.reduce(0.0) { $0 + $1.value } }
    }

    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        return dateFormatter.string(from: date)
    }

    func formatMonth(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: date)
    }

    func createDate(day: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = 2023
        dateComponents.month = 7
        dateComponents.day = day
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.second = 0

        return Calendar.current.date(from: dateComponents)!
    }
}

struct BarChartViewNew: View {
    let data: [Double]
    let xLabels: [String]
    let maxDataValue: Double

    var body: some View {
        HStack {
            ForEach(0..<data.count, id: \.self) { index in
                VStack {
                    Spacer()
                    Text("\(Int(data[index]))")
                        .font(.caption)
                        .padding(.bottom, 5)
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: CGFloat(data[index] / maxDataValue) * 200) // Adjust the height as needed
                    Text(xLabels[index])
                        .font(.caption)
                        //.rotationEffect(.degrees(-45), anchor: .bottom)
                        .frame(width: 50)
                }
            }
        }
        .padding() // Add padding around the entire chart
        .background(Color(.systemGray6))
        .cornerRadius(5) // Add corner radius for a rounded appearance
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2) // Add a subtle shadow
        .frame(width:370, height: 300) // Adjust the overall height of the chart
        
    }
}
