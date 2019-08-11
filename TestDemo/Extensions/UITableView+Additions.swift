//
//  UITableView+Additions.swift
//  TestDemo
//
//  Created by Fahad Attique on 11/08/2019.
//  Copyright © 2019 Fahid. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerNib(from cellClass: UITableViewCell.Type) {
        let identifier = cellClass.identifier
        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    func registerNibHeaderFooter(from viewClass: UITableViewHeaderFooterView.Type) {
        let identifier = viewClass.identifier
        register(UINib(nibName: identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func registerCell(from cellClass: UITableViewCell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.identifier)
    }
    
    func registerHeaderFooter(from viewClass: UITableViewHeaderFooterView.Type) {
        register(viewClass, forHeaderFooterViewReuseIdentifier: viewClass.identifier)
    }

    func dequeue<T: Any>(cell: UITableViewCell.Type) -> T? {
        return dequeueReusableCell(withIdentifier: cell.identifier) as? T
    }
    
    func dequeue<T: Any>(headerFooter: UITableViewHeaderFooterView.Type) -> T? {
        return dequeueReusableHeaderFooterView(withIdentifier: headerFooter.identifier) as? T
    }
    
    func addRefreshControl(_ refresher: UIRefreshControl, withSelector selector:Selector) {
        
        refresher.addTarget(nil, action: selector, for: .valueChanged)
        if #available(iOS 10.0, *) {
            refreshControl = refresher
        } else {
            addSubview(refresher)
        }
    }
}
