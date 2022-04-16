//
//  AnyObjectExtensions.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 16.04.2022.
//

import Foundation

extension NSObject {
    
    class var identifier: String {
        return String(describing: self)
    }
}
