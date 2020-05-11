//
//  EventModel.swift
//  Suitmedia
//
//  Created by irwan on 10/05/20.
//  Copyright © 2020 irwan. All rights reserved.
//

import Foundation

struct Event {
    let id: Int
    let name: String
    let subTitle: String
    let Date: String
    let imageEvent: String
    
    static let data = [
        Event(id: 001, name: "name satu", subTitle: "lorem ipsum si doler ismet", Date: "April 01 2020",imageEvent: "img1"),
        Event(id: 002,name: "name dua", subTitle: "lorem ipsum si doler ismet", Date: "April 02 2020",imageEvent: "img2"),
        Event(id: 003,name: "name tiga", subTitle: "lorem ipsum si doler ismet", Date: "April 03 2020",imageEvent: "img3"),
        Event(id: 004,name: "name empat", subTitle: "lorem ipsum si doler ismet", Date: "April 04 2020",imageEvent: "img4"),
        Event(id: 005,name: "name lima", subTitle: "lorem ipsum si doler ismet", Date: "April 05 2020",imageEvent: "img5"),
        Event(id: 006,name: "name enam", subTitle: "lorem ipsum si doler ismet", Date: "April 06 2020",imageEvent: "img1"),
       
    ]
}
