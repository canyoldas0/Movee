//
//  File name: EndPointHelper.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import Foundation
import CYBase

typealias BaseUrl = EndpointHelper.BaseUrls
typealias Path = EndpointHelper.Paths


enum EndpointHelper {
    
    enum BaseUrls: String {
        case base = "https://wft-geo-db.p.rapidapi.com/v1/geo/"
    }
    
    enum Paths: CYValueProtocol {
        
        typealias Value = String
        
        var value: String {
            switch self {
//            case .countryList:
//                return "countries"
//            case .countryDetail(let id):
//                return "countries/\(id)"
 
            }
        }
        
//        case countryList
//        case countryDetail(String)
        //case auth

    }
   
}
