//
//  ErrorResponse.swift
//  MovieDiary
//
//  Created by Can Yoldas on 4.12.2021.
//

import Foundation

class ErrorResponse: Error {
     let serverResponse: ServerResponse?
     let apiConnectionErrorType: ApiConnectionErrorType?

     init(serverResponse: ServerResponse? = nil, apiConnectionErrorType: ApiConnectionErrorType? = nil) {
        self.serverResponse = serverResponse
        self.apiConnectionErrorType = apiConnectionErrorType
    }

}
