//
//  Order.swift
//  Appetizers
//
//  Created by Марина on 05.11.2023.
//

import Foundation


final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    
    var totalPrice: Double {
        items.reduce(0) {$0 + $1.price}
    }
    
    
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
