//
//  AddOrderButton.swift
//  Appetizers
//
//  Created by Ömer Faruk Dikili on 5.02.2025.
//

import SwiftUI

struct GeneralAppButtonLabel: View {
    var title : String
    var body: some View {
        Label(title,systemImage: "")
            .frame(width: 240, height: 36)
    }
}

#Preview {
    GeneralAppButtonLabel(title: "Click me")
}
