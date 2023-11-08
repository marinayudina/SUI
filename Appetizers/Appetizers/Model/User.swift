//
//  User.swift
//  Appetizers
//
//  Created by Марина on 04.11.2023.
//

import Foundation

struct User: Codable {
    var firstName            = ""
    var lastName            = ""
    var emailAdress          = ""
    var birthdate =         Date()
    var extraNapkins =      false
    var frequentRefills =   false
}
