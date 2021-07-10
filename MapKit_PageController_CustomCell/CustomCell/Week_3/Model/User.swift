//
//  User.swift
//  Week_3
//
//  Created by Dogukan Berk Ozer on 10.07.2021.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name: String
    let email: String
    let compony: Company
}

struct Company: Decodable {
    let name: String
}
