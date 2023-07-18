//
//  BatteryHealthView.swift
//  Charge2Change
//
//  Created by Ahmet Senturk on 18.07.23.
//

import SwiftUI

struct BatteryHealthView: View {
    @State private var batteryHealth: Double = 80
    
    var body: some View {
        Text("Battery Health:")
            .font(.headline)
            .padding(.horizontal, -180)
        HStack {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .cornerRadius(10)
                        .foregroundColor(Color(.systemGray5))
                        .frame(height: 10)
                    Rectangle()
                        .cornerRadius(10)
                        .foregroundColor(.green)
                        .frame(width: geometry.size.width * CGFloat(batteryHealth / 100), height: 10)
                }
            }
            .frame(height: 10)
            Text("\(Int(batteryHealth))%")
                .font(.headline)
                .fontWeight(.bold)
        }
        .padding()
    }
}

struct BatteryHealthView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryHealthView()
    }
}
