//
//  User.swift
//  Slow
//
//  Created by Vinter Marco on 11.01.2024.
//

import Foundation

struct User : Identifiable, Codable {
    let id : String
    let firstName : String
    let lastName : String
    let email : String

    
    var fullName : String {
        return lastName + " " + firstName
    }
    
    var initials : String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}


extension User {
    static var MOCK_USER = User(
        id: NSUUID().uuidString,
        firstName: "Marco",
        lastName: "Vinter",
        email: "vintermarco98@gmail.com")
}
