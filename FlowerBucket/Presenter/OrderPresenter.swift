//
//  OrderPresenter.swift
//  FlowerBucket
//
//  Created by Catalin David on 2/3/18.
//  Copyright © 2018 Catalin David. All rights reserved.
//

import Foundation

class OrderPresenter: PresenterProtocol {
    var view: OrderListView?
    var orderService: OrderService
    
    init(orderService: OrderService) {
        self.orderService = orderService
    }
    
    func attach(view: OrderListView) {
        self.view = view
    }
    
    func detach(view: OrderListView) {
        self.view = nil
    }
    
    func loadOrders() {
        self.view?.startLoading()
        orderService.fetchAllOrders() { [weak self] orders in
            guard let orders = orders else {
                self?.view?.setEmptyOrders()
                return
            }
            self?.view?.stopLoading()
            self?.view?.setOrders(orders: orders)
        }
    }
}
