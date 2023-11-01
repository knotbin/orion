//
//  User.swift
//  Orion
//
//  Created by Beau Rubin-Rottenberg on 9/6/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
