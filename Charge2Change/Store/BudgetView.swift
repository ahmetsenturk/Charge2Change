//
//  BudgetView.swift
//  Charge2Change
//
//  Created by Ahmet Senturk on 18.07.23.
//

import SwiftUI

struct BudgetView: View {
    
    var body: some View {
        HStack {
            Image(systemName: "centsign.circle")
                .foregroundColor(Color.orange)
            Text("1,200")
        }
        .padding()
        .frame(height: 40)
        .background(Color(.systemGray6))
        .cornerRadius(5) // Add corner radius for a rounded appearance
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2) // Add a subtle shadow
        
    }
}

struct BudgetView_Preview: PreviewProvider {
    
    static var previews: some View {
        BudgetView()
    }
}
