//
//  User.swift
//  Appetizers
//
//  Created by Ömer Faruk Dikili on 6.02.2025.
//

import Foundation
struct User: Codable {
      var email: String = ""
      var firstName: String = ""
      var lastName: String = ""
      var dateTime: Date = Date()
      var extraNapkins: Bool = false
      var frequentsRefills: Bool = false
}
