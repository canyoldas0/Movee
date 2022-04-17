//
//  MoviesDataFormatter.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 17.04.2022.
//

import Foundation
import CYBase

protocol MoviesDataFormatterProtocol: AnyObject {
    
    
    func setData(with response: MovieListDataResponse)
    func getItem(at index: Int) -> String?
    func getCount() -> Int
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getImageUrl(at index: Int) -> String
    func getItemId(at index: Int) -> Int
}

class MoviesDataFormatter: MoviesDataFormatterProtocol {
    
    private var list: [MovieResult] = [MovieResult]()
    
    func setData(with response: MovieListDataResponse) {
        self.list.append(contentsOf: response.results)
    }
    
    func getItem(at index: Int) -> String? {
        
//        return CustomImageViewComponentData(imageUrl: getImageUrl(at: index))
        return ""
    }
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        return list.count
    }
    
    func getCount() -> Int {
        return list.count
    }
    
    // MARK: - Get Properties
    func getImageUrl(at index: Int) -> String {
        return list[index].posterURL
    }
    
    func getItemId(at index: Int) -> Int {
        return list[index].id ?? 0
    }

}
