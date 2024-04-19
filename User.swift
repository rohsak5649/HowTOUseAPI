//
//  user.swift
//  ApiUse
//
//  Created by Rohan Sakhare on 19/04/24.
//

import Foundation

struct User: Codable {
    let name: Name
    let email: String
    
    struct Name: Codable {
        let first: String
        let last: String
    }
}
