//
//  OrderView.swift
//  Appetizers
//
//  Created by Ömer Faruk Dikili on 3.02.2025.
//

import SwiftUI

struct OrderView: View {
    @State var orderItems : [Appetizer] = MockData.orderItems
    var body: some View {
        NavigationView{
            VStack{
                List(){
                    ForEach(orderItems){
                        appetizer in
                          AppetizerListItem(appetizer: appetizer)
                    }
                    .onDelete(
                        perform:deleteItem
                    )
                 }
                
                 .listStyle(PlainListStyle())
                Button{
                } label: {
                    AddOrderButton(price: 99.99)
                }
                .buttonStyle(.borderedProminent)
                .padding()

            }
                .navigationTitle("🧾 Orders")
        }
    }
    
    func deleteItem(at indexSet: IndexSet) {
        orderItems.remove(atOffsets: indexSet)
    }
}

#Preview {
    OrderView()
}
