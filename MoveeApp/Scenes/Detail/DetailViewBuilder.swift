//
//  DetailViewBuilder.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 22.06.2022.
//

import UIKit

enum ContentType {
    case movie
    case tvSeries
}

class DetailViewBuilder {
    
    class func build(with id: Int,
                     contentType: ContentType) -> UIViewController {
        
        let viewModel = DetailViewModel(id: id)
        let vc = DetailViewController(viewModel: viewModel)
        vc.navigationController?.navigationBar.prefersLargeTitles = false
        vc.contentType = contentType
        return vc
    }
}

