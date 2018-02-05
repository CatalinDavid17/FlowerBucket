//
//  File.swift
//  FlowerBucket
//
//  Created by Catalin David on 2/3/18.
//  Copyright © 2018 Catalin David. All rights reserved.
//

import Foundation

protocol OrderListView {
    func startLoading()
    func stopLoading()
    func setOrders(orders: [Order])
    func setEmptyOrders()
}
