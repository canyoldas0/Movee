//
//  String+Extension.swift
//  MovieDiary
//
//  Created by Can Yoldas on 3.12.2021.
//

import Foundation

extension String {
    
    func asURL() throws -> URL {
        guard let url = URL(string: self) else {  throw NetworkError.missingURL }
        return url
    }
}

extension String {
    
    func toLocalize() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
}
