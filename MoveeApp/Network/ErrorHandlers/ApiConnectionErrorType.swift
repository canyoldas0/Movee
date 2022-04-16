//
//  ApiConnectionErrorType.swift
//  MovieDiary
//
//  Created by Can Yoldas on 4.12.2021.
//

import Foundation

enum ApiConnectionErrorType {
    case missingData(Int)
    case connectionError(Int)
    case serverError(Int)
    case dataDecodedFailed(String)
}
