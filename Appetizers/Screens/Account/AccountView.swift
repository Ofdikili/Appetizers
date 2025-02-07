//
//  AccountView.swift
//  Appetizers
//
//  Created by Ömer Faruk Dikili on 3.02.2025.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var accountVM = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    var body: some View {
        NavigationView{
            Form{
                Section("Personal Information"){
                    TextField("First Name", text: $accountVM.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit{focusedTextField = .lastName}
                        .submitLabel(.next)
                    
                    TextField("Last Name", text:$accountVM.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit{focusedTextField = .email}
                        .submitLabel(.next)
                    TextField("Email", text:$accountVM.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit{focusedTextField = nil}
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                    DatePicker(
                        "BirthDay",selection: $accountVM.user.dateTime,displayedComponents: .date
                    )
                    Button{
                        accountVM.saveChanged()
                    }label: {
                        Text("Save Changes")
                    }
                }
                Section("Requests"){
                    Toggle("Extra Napkins",isOn: $accountVM.user.extraNapkins)
                    Toggle("Frequent Refiils",isOn: $accountVM.user.frequentsRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }.navigationTitle("Account")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Dismiss") {
                            focusedTextField = nil
                        }
                    }
                }
        }
        .alert(item:$accountVM.alertItem){
            alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton:alertItem.dismissButton)
        }
        .onAppear(){
            accountVM.loadUser()
        }
            }
}

#Preview {
    AccountView()
}
