//
//  Order.swift
//  Appetizers
//
//  Created by Ömer Faruk Dikili on 4.02.2025.
//

import Foundation
import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalPrice : Double {
        items.reduce(0) { $0 + $1.price } 
    }
    
    func addItem(_ item: Appetizer) {
        items.append(item)
    }
    
    func removeItem(at index: IndexSet) {
        items.remove(atOffsets: index)
    }
    
}
