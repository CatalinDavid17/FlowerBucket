//
//  OrderCell.swift
//  FlowerBucket
//
//  Created by Catalin David on 2/5/18.
//  Copyright © 2018 Catalin David. All rights reserved.
//

import UIKit

protocol OrderCellDelegate {
    func didTapOn(cell: OrderCell)
}

class OrderCell: UITableViewCell {
    
    // Mark: - IBOutlets
    @IBOutlet weak var product: UILabel!
    @IBOutlet weak var receiver: UILabel!
    @IBOutlet weak var price: UILabel!
    
    // Mark: - Properties
    var delegate: OrderCellDelegate?
    var order: Order? {
        didSet {
            guard let order = order else { return }
            product.text = order.description
            receiver.text = order.deliversTo
            price.text = String(describing: order.price!)
        }
    }
    
    // MARK: - Actions
    @IBAction func cellTapped(_ sender: UIButton) {
        delegate?.didTapOn(cell: self)
    }
}

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
