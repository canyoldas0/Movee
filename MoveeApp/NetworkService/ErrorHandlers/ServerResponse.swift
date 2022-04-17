//
//  ServerResponse.swift
//  MovieDiary
//
//  Created by Can Yoldas on 4.12.2021.
//

import Foundation

class ServerResponse: Codable, Error {
    let returnMessage: String?
    let returnCode: Int?

    init(returnMessage: String? = nil, returnCode: Int? = nil) {
       self.returnMessage = returnMessage
       self.returnCode = returnCode
   }
}
