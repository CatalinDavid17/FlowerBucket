//
//  DetailViewController.swift
//  FlowerBucket
//
//  Created by Catalin David on 2/5/18.
//  Copyright © 2018 Catalin David. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var product: UILabel!
    @IBOutlet weak var receiver: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var order: Order?
    
    override func viewDidLoad() {
        guard let product = order?.description, let receiver = order?.deliversTo, let price = order?.price else { return }
        self.product.text = product
        self.receiver.text = receiver
        self.price.text = String(describing: price)
    }
}
