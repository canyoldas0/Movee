//
//  DetailViewController.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 22.06.2022.
//

import UIKit
import CYBase

class DetailViewController: CYViewController<DetailViewModel> {
    
    var contentType: ContentType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .clear
        view.backgroundColor = .moveeBackground
        
        viewModel.getDetailData(for: contentType)
    }
}
