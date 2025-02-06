//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Ömer Faruk Dikili on 5.02.2025.
//

import Foundation
import SwiftUI

class AccountViewModel : ObservableObject {
    @AppStorage("user") private var userData : Data?
    @Published var user: User = User()
    @Published var alertItem : AlertItem?
    
    var isValiForm : Bool {
        guard !user.email.isEmpty && !user.firstName.isEmpty && !user.lastName.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false}
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false}
        return true
    }
    
    func loadUser(){
         guard let userData = userData else {return}
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            print("Error decoding user data: \(error)")
        }
    }
    
    func saveChanged(){
        guard isValiForm else {return}
        
        do{
            var data : Data? = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.successAlert
        }catch{
            alertItem = AlertContext.invalidUserData

        }
    }
}
