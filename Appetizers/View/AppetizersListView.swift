//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by Ömer Faruk Dikili on 3.02.2025.
//

import SwiftUI

struct AppetizersListView: View {
    
    @State var appetizerList : [Appetizer] = []
    @State var selectedAppetizer : Appetizer? = nil
    @State var isLoading : Bool = false
    var body: some View {
        NavigationView{
            if isLoading{
                ProgressView("Loading")
            }
            
                    else {
               List(appetizerList){
                    appetizer in
                    AppetizerListItem(appetizer: appetizer)
                }.navigationTitle("🍟 Appetizers")
                           
           }
        }.onAppear{
            loadAppetizers()
        }
    }
    
    func loadAppetizers() {
        isLoading = true
        let networkManager: NetworkManager = NetworkManager.shared
        networkManager.getAppetizers { (result) in
            switch(result){
            case .success(let appetizers):
                self.appetizerList = appetizers
                self.isLoading = false
            case .failure(let error):
                print("Error fetching appetizers: \(error.localizedDescription)")
            }
        }
    }
    
//    func loadAppetizers() {
//        isLoading = true
//        let networkManager: NetworkManager = NetworkManager.shared
//        networkManager.getAppetizers {(result) in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let appetizers):
//                    self.appetizerList = appetizers
//                    self.isLoading = false  // Veri gelince loading kaldır
//                    
//                case .failure(let error):
//                    self.isLoading = false  // Hata olsa da loading kapanmalı
//                    print("Error fetching appetizers: \(error.localizedDescription)")
//   
//                }
//            }
//        }
//    }

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
