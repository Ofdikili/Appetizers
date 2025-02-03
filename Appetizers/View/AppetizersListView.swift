//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by Ömer Faruk Dikili on 3.02.2025.
//

import SwiftUI

struct AppetizersListView: View {
    
    @StateObject private var appetizerVM = AppetizersViewModel()
    var body: some View {
        ZStack{
            NavigationView{
                List(appetizerVM.appetizers){
                appetizer in
                AppetizerListItem(appetizer: appetizer)
                        
            }.navigationTitle("🍟 Appetizers")
                
                }.onAppear{
                    appetizerVM.loadAppetizers()
                }
            if(appetizerVM.isLoading){
                ProgressView()
            }
        } .alert(item:$appetizerVM.alertItem){
            alertItem in
            Alert(
                title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton
            )
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
