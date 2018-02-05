//
//  File.swift
//  FlowerBucket
//
//  Created by Catalin David on 2/3/18.
//  Copyright © 2018 Catalin David. All rights reserved.
//

import Foundation

protocol PresenterProtocol {
    func attach(view: OrderListView)
    func detach(view: OrderListView)
    func loadOrders()
}
