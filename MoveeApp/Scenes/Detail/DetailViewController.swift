//
//  DetailViewController.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 22.06.2022.
//

import UIKit
import CYBase
import SnapKit

class DetailViewController: CYViewController<DetailViewModel> {
    
    var contentType: ContentType?
    var detailView: DetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .clear
        view.backgroundColor = .moveeBackground
        
        viewModel.getDetailData(for: contentType)
        setupLayout()
    }
    
    private func setupLayout() {
        self.detailView = DetailView()
        detailView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(detailView)
        detailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
