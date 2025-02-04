//
//  AddOrderButton.swift
//  Appetizers
//
//  Created by Ömer Faruk Dikili on 5.02.2025.
//

import SwiftUI

struct AddOrderButton: View {
    var price : Double = 0
    var body: some View {
        Label("$ \(price,specifier: "%.2f") - Add to Order",systemImage: "")
            .frame(width: 240, height: 36)
    }
}

#Preview {
    AddOrderButton()
}
