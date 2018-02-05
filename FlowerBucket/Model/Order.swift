//
//  Order.swift
//  FlowerBucket
//
//  Created by Catalin David on 2/3/18.
//  Copyright © 2018 Catalin David. All rights reserved.
//

import Foundation

class Order {
    var id: Int?
    var description: String?
    var price: Double?
    var deliversTo: String?
    
    init(jsonData: [String: Any]) {
        id = jsonData["id"] as? Int
        description = jsonData["description"] as? String
        price = jsonData["price"] as? Double
        deliversTo = jsonData["deliver_to"] as? String
    }
}
