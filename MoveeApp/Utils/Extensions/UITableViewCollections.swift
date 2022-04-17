//
//  UITableViewCollections.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 16.04.2022.
//

import UIKit

extension UITableView {
    
    func registerNib(withIdentifier identifier: String) {
        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    func dequeue<T: UITableViewCell>(withIdentifier identifier: String = String(describing: T.self)) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? T else {
            fatalError("Could not dequeue cell with identifier \(identifier) from tableView \(self)")
        }
        
        return cell
    }
    
    func dequeue<T: UITableViewCell>(withIdentifier identifier: String = String(describing: T.self), at indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier \(identifier) from tableView \(self)")
        }
        
        return cell
    }
    
    
}



extension UITableViewCell {
    
    
    static func dequeue(fromTableView tableView: UITableView, atIndexPath indexPath: IndexPath) -> Self {
        guard let cell: Self = tableView.dequeue(withIdentifier: self.identifier, at: indexPath) as? Self else {
#if DEBUG
            fatalError("*** Failed to dequeue Cell ***")
#else
            return self
#endif
        }
        return cell
    }
    
}

