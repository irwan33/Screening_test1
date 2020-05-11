//
//  UserModel.swift
//  Suitmedia
//
//  Created by irwan on 10/05/20.
//  Copyright © 2020 irwan. All rights reserved.
//

import Foundation

struct UserModel: Codable {
    let data: [GetDataUserModel]?
   
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

struct GetDataUserModel: Codable {
    let id: Int?
    let email: String?
    let first_name: String?
    let last_name: String?
    let avatar: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
        case first_name = "first_name"
        case last_name = "last_name"
        case avatar = "avatar"
    }
}
