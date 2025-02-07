//
//  AppetizersViewModel.swift
//  Appetizers
//
//  Created by Ömer Faruk Dikili on 4.02.2025.
//

import Foundation
@MainActor class AppetizersViewModel : ObservableObject{
    var networkManager: NetworkManager = .shared
    @Published var alertItem: AlertItem?
    @Published var isLoading:Bool = false
    @Published var appetizers: [Appetizer] = []
    @Published var showDetailView:Bool = false
    @Published var selectedAppetizer: Appetizer?{
        didSet {
            self.showDetailView = true
        }
    }
    
    func loadAppetizers() {
        isLoading = true
        Task{
            do{
                appetizers = try await networkManager.getAppetizersWithAsync()
                isLoading = false
            }catch{
                alertItem = AlertContext.invalidResponse
                isLoading = false
            }
        }
    }
    
//    func loadAppetizers() {
//        self.isLoading = true
//        let networkManager: NetworkManager = NetworkManager.shared
//        networkManager.getAppetizers { (result) in
//            DispatchQueue.main.async {
//                switch(result){
//                case .success(let appetizers):
//                    self.appetizers = appetizers
////                    self.alertItem = AlertContext.successAlert
//                    self.isLoading = false
//                case .failure(let error):
//                    self.isLoading = false
//                    switch(error){
//                    case .invalidData:
//                        self.alertItem = AlertContext.invalidData
//                    case .invalidUrl:
//                        self.alertItem = AlertContext.invalidURL
//
//                    case .invalidResponse:
//                        self.alertItem = AlertContext.invalidResponse
//                    case .invalidToComplete:
//                        self.alertItem = AlertContext.unableToComplete
//
//                    }
//                }
//            }
//        }
//    }
    
    
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
