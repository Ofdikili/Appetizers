//
//  ContentView.swift
//  Appetizers
//
//  Created by Ömer Faruk Dikili on 3.02.2025.
//

import SwiftUI

struct ApptizerTabView: View {
    @EnvironmentObject var order : Order
    var body: some View {
        TabView {
            AppetizersListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
                .badge(order.orderCount)
        }
        .accentColor(Color("brandPrimary"))
    }
}

#Preview {
    ApptizerTabView()
}
