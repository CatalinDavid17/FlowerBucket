//
//  APIManager.swift
//  FlowerBucket
//
//  Created by Catalin David on 2/3/18.
//  Copyright © 2018 Catalin David. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class OrderService {
    static let sharedInstance = OrderService()
    
    func fetchAllOrders(completion: @escaping ([Order]?) -> Void) {
        Alamofire.request(
            URL(string: "http://demo7738099.mockable.io")!,
            method: .get)
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    print("Error while fetching orders: \(String(describing: response.result.error))")
                    completion(nil)
                    return
                }
                
                guard let value = response.result.value as? NSArray,
                    let rows = value as? [[String: Any]] else {
                        print("Malformed data received from fetchAllOrders service")
                        completion(nil)
                        return
                }
                
                let orders = rows.flatMap({ (orderDict) -> Order? in
                    return Order(jsonData: orderDict)
                })
                
                completion(orders)
        }
    }
}
