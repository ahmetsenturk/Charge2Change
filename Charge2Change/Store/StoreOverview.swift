//
//  StoreOverview.swift
//  Charge2Change
//
//  Created by Ahmet Senturk on 18.07.23.
//

import SwiftUI

struct HighlightSection: View {
    let stores: [StoreModel]
    let sortingOptions = ["Low Coins First", "High Coins First"]
    
    @State private var selectedSortingOption = 0
    @State private var selectedStoreIndex = 0
    
    var sortedStores: [StoreModel] {
        switch selectedSortingOption {
        case 0: // Low Coins First
            return stores.sorted { $0.coins < $1.coins }
        case 1: // High Coins First
            return stores.sorted { $0.coins > $1.coins }
        default:
            return stores
        }
    }

    var body: some View {
        VStack(spacing: 16) {
            Text("Store")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            BudgetView()
                .offset(x: 130)
            VStack {
                HStack {
                    Text("Special Offers")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal, 16)
                HStack(spacing: 6) {
                    ForEach(stores.indices) { index in
                        Circle()
                            .fill(index == selectedStoreIndex ? Color.blue : Color(.systemGray5))
                            .frame(width: 8, height: 8)
                    }
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.horizontal, 16)
                TabView(selection: $selectedStoreIndex) {
                    ForEach(stores.indices) { index in
                        StoreView(store: stores[index])
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .padding(.horizontal, 16)
                .frame(height: 200)
            }
            VStack {
                Picker("Sort", selection: $selectedSortingOption) {
                    ForEach(0..<sortingOptions.count) { index in
                        Text(sortingOptions[index])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                List(sortedStores) { store in
                    StoreView(store: store)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct StoreView: View {
    let store: StoreModel

    var body: some View {
        ZStack {
            Image(store.background)
                .resizable()
                .aspectRatio(contentMode: .fit)
                //.frame(height: 100)
                //.cornerRadius(10)
            HStack(alignment: .bottom, spacing: 8) {
                Image(store.icon)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2) // Add a subtle shadow
                    .padding()

                Spacer()
                HStack {
                    VStack {
                        Text(store.description)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        HStack {
                            Text("\(store.coins)").foregroundColor(.orange)
                            Image(systemName: "centsign.circle")
                                .foregroundColor(.orange)
                        }
                    }
                }
                .frame(width: 140, height: 50)
                .background(Color(.systemGray6))
                .cornerRadius(5) // Add corner radius for a rounded appearance
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2) // Add a subtle shadow
                .padding()
                .opacity(0.9)
            }
        }
        .frame(maxWidth: .infinity)
    }
}


struct StoreView_Previews: PreviewProvider {
    static var s1 = StoreModel(description: "Free Parking", coins: 500, icon: "freeparking", background: "freeparking-background")
    static var previews: some View {
        StoreView(store: s1)
    }
}

