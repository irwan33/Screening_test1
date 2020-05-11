//
//  ScreenFourInteractor.swift
//  Suitmedia
//
//  Created by irwan on 10/05/20.
//  Copyright © 2020 irwan. All rights reserved.
//

import Foundation
class UserList: Service {
    static let shared =  UserList()
    
    func getListUser(completion: @escaping (Data?, Error?) -> Void) {
        get("\(Endpoints.BASE)\(Endpoints.USER)") { (result, error) in
            completion(result, error)
        }
    }
}
