//
//  StringExtensions.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 23.06.2022.
//

import Foundation

extension String {
    
    func convertDate(from: DateFormats, to: DateFormats) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = from.rawValue
        let date = dateFormatter.date(from: self)
        return date?.formatDateWith(format: to)
    }
}
