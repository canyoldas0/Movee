//
//  UICollectionView+Extensions.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 17.04.2022.
//

import UIKit


extension UICollectionViewCell {
    
    static func dequeue(fromCollectionView collectionView: UICollectionView, atIndexPath indexPath: IndexPath) -> Self {
        guard let cell: Self = collectionView.dequeue(at: indexPath) as? Self else {
#if DEBUG
            fatalError("*** Failed to dequeue Cell ***")
#else
            return self
#endif
        }
        return cell
    }
}


extension UICollectionView {
    
    func registerNib(withIdentifier identifier: String) {
        register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }

    func dequeue<C: UICollectionViewCell>(at indexPath: IndexPath) -> C? {
            guard let cell = self.dequeueReusableCell(withReuseIdentifier: C.identifier, for: indexPath) as? C
                else {
                    #if DEBUG
                    fatalError("could not deque cell with identifier \(C.identifier) from collectionview \(self)")
                    #else
                    return nil
                    #endif
            }
            return cell
        }

}
