//
//  EcoImpactView.swift
//  Charge2Change
//
//  Created by Ahmet Senturk on 18.07.23.
//

import SwiftUI

struct EcoImpactView: View {
    let data: [Int]
    let labels: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<data.count, id: \.self) { index in
                HStack {
                    Text(labels[index])
                        .font(.caption)
                        .padding(.bottom, 5)
                    ForEach(0..<data[index], id: \.self) { index2 in
                        Image(systemName: "tree.fill")
                            .foregroundColor(Color.green)
                    }
                }
            }
        }
        .padding() // Add padding around the entire chart
        .background(Color(.systemGray6))
        .cornerRadius(5) // Add corner radius for a rounded appearance
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2) // Add a subtle shadow
        
    }

}
