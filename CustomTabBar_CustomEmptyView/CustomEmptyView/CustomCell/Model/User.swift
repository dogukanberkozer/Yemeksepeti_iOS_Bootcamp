//
//  User.swift
//  CustomCell
//
//  Created by Dogukan Berk Ozer on 2.08.2021.
//

import Foundation

struct User: Decodable {
    
    let id: Int
    let name: String
    let email: String
    let company: Company
}

struct Company: Decodable {
    let name: String
}
