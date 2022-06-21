//
//  MoviesViewBuilder.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 16.04.2022.
//

import UIKit

class MainViewBuilder {
    
    class func build() -> UIViewController {
        let viewModel = MoviesViewModel()
        let viewController = MoviesViewController(viewModel: viewModel)
        viewController.title = "Movies"
        let navigationVC = UINavigationController(rootViewController: viewController)
        navigationVC.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        navigationVC.navigationBar.prefersLargeTitles = true
        return navigationVC
    }
}
