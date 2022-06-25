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
    
    deinit {
        print("detail vc deinit")
    }
    
    var contentType: ContentType?
    var detailView: DetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .clear
        view.backgroundColor = .moveeBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        subscribeToViewModel()
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
    
    private func subscribeToViewModel() {
        
        viewModel.listenViewModel { [weak self] state in
            
            switch state {
            case .done:
                self?.detailView.setData(data: self?.viewModel.getViewData())
            default:
                break
            }
        }
    }
}
