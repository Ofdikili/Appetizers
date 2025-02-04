//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Ömer Faruk Dikili on 5.02.2025.
//

import Foundation
class AccountViewModel : ObservableObject {
    @Published  var email: String = ""
    @Published  var firstName: String = ""
    @Published  var lastName: String = ""
    @Published  var dateTime: Date = Date()
    @Published  var extraNapkins: Bool = false
    @Published  var frequentsRefills: Bool = false
}
