//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by Ömer Faruk Dikili on 3.02.2025.
//

import SwiftUI

struct AppetizersListView: View {
    var body: some View {
        NavigationView{
            List(MockData.appetizers){
                appetizer in
                AppetizerListItem(appetizer: appetizer)
            }.navigationTitle("🍟 Appetizers")
        }
    }
}

struct AppetizerListItem:View {
    let appetizer:Appetizer
    var body: some View {
            HStack{
            Image("asian-flank-steak")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
                VStack(alignment:.leading,spacing: 5){
                    Text(appetizer.name)
                        .font(.title2)
                        .fontWeight(.medium)
                    Text("$\(appetizer.price,specifier: "%.2f")")
                        .foregroundStyle(.secondary)
                        .fontWeight(.semibold)
                }
        }
    }
}

#Preview {
    AppetizersListView()
}
