//
//  DateExtensions.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 16.04.2022.
//

import Foundation

enum DateFormats: String {
    
    case ddMMyyyy = "dd.MM.yyyy"
    case yyyyMMddHHmmssZZZZ = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    case mmddyyyy = "MM/dd/yyyy"
    case yyyyMMdd = "yyyy-MM-dd"
    case ddmmYYYY = "dd/MM/yyyy"
    case yyyyMMddHHmmssZ = "yyyy-MM-dd'T'HH:mm:ssZ"
    case yyyMMddhhmmss = "yyyy-MM-dd hh:mm:ss"
    case ddMMMMyyyy = "dd MMMM yyyy"
    
}

extension Date {
    
    func formatDateWith(format: DateFormats) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: self)
    }
    
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
