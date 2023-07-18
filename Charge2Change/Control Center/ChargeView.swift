//
//  ChargeView.swift
//  Charge2Change
//
//  Created by Ahmet Senturk on 18.07.23.
//

import SwiftUI

struct ChargeView: View {
    var chargePercentage: Double
    
    private let circleLineWidth: CGFloat = 50
    private let circleRadiusMultiplier: CGFloat = 0.5
    
    private var circleColor: Color {
        if chargePercentage <= 20 {
            return .red
        } else if chargePercentage <= 50 {
            return .orange
        } else if chargePercentage <= 80 {
            return .yellow
        } else {
            return .green
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            let circleRadius = min(geometry.size.width, geometry.size.height) / 2 * circleRadiusMultiplier
            ZStack {
                Circle()
                    .stroke(lineWidth: circleLineWidth)
                    .foregroundColor(circleColor)
                    .frame(width: circleRadius * 2, height: circleRadius * 2)
                
                Circle()
                    .trim(from: 0, to: CGFloat(chargePercentage / 100))
                    .stroke(style: StrokeStyle(lineWidth: circleLineWidth, lineCap: .round))
                    .foregroundColor(.green)
                    .rotationEffect(.degrees(-90))
                    .frame(width: circleRadius * 2, height: circleRadius * 2)
                
                VStack {
                    Image(systemName: "bolt.fill")
                        .font(.system(size: 50))
                    
                    Text("\(Int(chargePercentage))%")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .offset(y: circleLineWidth / 4.5)
            }
            .padding()
            .frame(width: geometry.size.width, height: circleRadius * 3.5, alignment: .center)
        }
    }
}

struct ChargeView_Previews: PreviewProvider {

    static var previews: some View {
        ChargeView(chargePercentage: 60)
    }
}

