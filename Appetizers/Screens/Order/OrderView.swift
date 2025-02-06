//
//  OrderView.swift
//  Appetizers
//
//  Created by Ömer Faruk Dikili on 3.02.2025.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order : Order
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    VStack{
                        List(){
                            ForEach(order.items){
                                appetizer in
                                  AppetizerListItem(appetizer: appetizer)
                            }
                            .onDelete(
                                perform: order.removeItem
                            )
                         }
                        
                         .listStyle(PlainListStyle())
                        Button{
                        } label: {
                            GeneralAppButtonLabel(title:
                                "$\(order.totalPrice) - Place Order"
                            )
                        }
                        .buttonStyle(.borderedProminent)
                        .padding()

                    }
                    if(order.items.isEmpty){
                        EmptyOrderView(emptyMesage:"You have no items in your order.Please add appetizer" , imageName: "empty-order")
                    }
                    }
                }
                .navigationTitle("🧾 Orders")
        }
    }
    
    
}

#Preview {
    OrderView()
}
