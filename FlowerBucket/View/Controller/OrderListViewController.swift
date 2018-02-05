//
//  OrderListViewController.swift
//  FlowerBucket
//
//  Created by Catalin David on 2/3/18.
//  Copyright © 2018 Catalin David. All rights reserved.
//

import UIKit
import MBProgressHUD

class OrderListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    
    var ordersToDisplay = [Order]()
    var orderPresenter = OrderPresenter(orderService: OrderService())
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(refreshControl:)), for: UIControlEvents.valueChanged)
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self

        orderPresenter.attach(view: self)
        orderPresenter.loadOrders()
        self.tableView.addSubview(self.refreshControl)
    }
    
    @objc func handleRefresh(refreshControl: UIRefreshControl) {
        orderPresenter.loadOrders()
        refreshControl.endRefreshing()
    }
}

// MARK: - Table View Data Source
extension OrderListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordersToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderCell.className, for: indexPath) as? OrderCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        cell.order = ordersToDisplay[indexPath.row]
        
        return cell
    }
}

// MARK: - OrderCell Delegate
extension OrderListViewController: OrderCellDelegate {
    func didTapOn(cell: OrderCell) {
        guard let detailViewController = storyboard?.instantiateViewController(withIdentifier: DetailViewController.className) as? DetailViewController else {
            return
        }
        detailViewController.order = cell.order
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - OrderListView
extension OrderListViewController: OrderListView {
    func startLoading() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "Loading..."
    }
    
    func stopLoading() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func setOrders(orders: [Order]) {
        ordersToDisplay = orders
        tableView.isHidden = false
        emptyView.isHidden = true
        tableView.reloadData()
    }
    
    func setEmptyOrders() {
        tableView.isHidden = true
        emptyView.isHidden = false
    }
}
