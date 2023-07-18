//
//  StoreList.swift
//  Charge2Change
//
//  Created by Ahmet Senturk on 18.07.23.
//

import Foundation

class StoreList: ObservableObject {
    var stores: [StoreModel]
    
    init(stores: [StoreModel]) {
        self.stores = stores
    }
    
    func addStore(_ store: StoreModel) {
        stores.append(store)
    }
    
    func removeStore(at index: Int) {
        stores.remove(at: index)
    }
    
    static func mockStores() -> StoreList {
        let s1 = StoreModel(description: "Free Parking", coins: 500, icon: "freeparking", background: "freeparking-background")
        let s2 = StoreModel(description: "Battery Check", coins: 1700, icon: "batterycheck", background: "batterycheck-background")
        let s3 = StoreModel(description: "Car Wash", coins: 800, icon: "carwash", background: "carwash-background")
        let s4 = StoreModel(description: "Charity", coins: 100, icon: "charity", background: "charity-background")

        
        let storeList = StoreList(stores: [s1, s2, s3, s4])
        return storeList
    }
}
