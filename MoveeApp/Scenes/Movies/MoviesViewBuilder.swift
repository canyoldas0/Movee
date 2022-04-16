//
//  MoviesViewBuilder.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 16.04.2022.
//

import UIKit

class MainViewBuilder {
    
    class func build() -> UIViewController {
        let viewModel = MoviesViewModel(networkService: NetworkManager())
        let viewController = MoviesViewController(viewModel: viewModel)
        return viewController
    }
}
