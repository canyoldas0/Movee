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
    
    
    lazy var imageView: UIImageView = {
        let temp = UIImageView(image: UIImage(named: "group4"))
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    lazy var scoreView: ScoreView = {
        let temp = ScoreView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.heightAnchor.constraint(equalToConstant: 24).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 61).isActive = true
        return temp
    }()
    
    lazy var titleLabel: UILabel = {
       let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = .systemFont(ofSize: 24, weight: .bold)
        temp.text = ""
        return temp
    }()
    
    lazy var categoryLabel: UILabel = {
       let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = .systemFont(ofSize: 15, weight: .medium)
        temp.text = ""
        return temp
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .clear
        view.backgroundColor = .moveeBackground
        
        viewModel.getDetailData(for: contentType)
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(400)
        }
        
        view.addSubview(scoreView)
        
        scoreView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.bottom.equalTo(imageView).offset(12)
        }
        
        scoreView.setScore(with: 9.3)
    }
    
}
