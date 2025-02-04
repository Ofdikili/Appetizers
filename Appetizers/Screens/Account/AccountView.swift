//
//  AccountView.swift
//  Appetizers
//
//  Created by Ömer Faruk Dikili on 3.02.2025.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var accountVM = AccountViewModel()
    var body: some View {
        NavigationView{
            Form{
                Section("Personal Information"){
                    TextField("First Name", text: $accountVM.firstName)
                    TextField("Last Name", text:$accountVM.lastName)
                    TextField("Email", text:$accountVM.email)
                        .keyboardType(.emailAddress)
                    DatePicker(
                        "BirthDay",selection: $accountVM.dateTime,displayedComponents: .date
                    )
                    Button{
                        
                    }label: {
                        Text("Save Changes")
                    }
                }
                Section("Requests"){
                    Toggle("Extra Napkins",isOn: $accountVM.extraNapkins)
                    Toggle("Frequent Refiils",isOn: $accountVM.frequentsRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }.navigationTitle("Account")
        }
            }
}

#Preview {
    AccountView()
}
