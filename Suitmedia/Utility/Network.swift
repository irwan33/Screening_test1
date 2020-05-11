//
//  Network.swift
//  Suitmedia
//
//  Created by irwan on 10/05/20.
//  Copyright © 2020 irwan. All rights reserved.
//

import Foundation
import Alamofire


class Service: Any {
    
    let baseApiUrl : String = "\(Endpoints.BASE)"
    func get(_ url: String, parameters: Parameters? = nil, completion: @escaping (Data?, Error?) -> Void) {
       Alamofire.request(url,method: .get, parameters: parameters, headers: nil).validate().responseData { response in
         switch response.result {
         case .success(let value):
           completion(value, nil)
         case .failure(let error):
           if let statusCode = response.response?.statusCode, let data = response.data {
             #if DEBUG
             debugPrint("ERROR STATUS CODE \(statusCode) of \(url)")
             #endif

             if statusCode == 429 {
               completion(nil, error)
               return
             }
             
             do {
               completion(nil, NSError(domain: "", code: statusCode, userInfo: [
                 NSLocalizedDescriptionKey:  "self.getErrMessage(msg: decodedData.message)"
               ]))
             } catch {
               completion(nil, error)
             }
           } else {
             completion(nil, error)
           }
         }
       }
     }
}
