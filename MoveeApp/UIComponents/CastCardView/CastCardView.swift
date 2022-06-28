//
//  CardCastView.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 25.06.2022.
//

import UIKit
import CYBase

struct CastCardViewData {
    let title: String?
    let items: [CYDataProtocol]?
}

class CastCardView: CYTableViewCell {
    
    var data: CastCardViewData?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 100, height: 130)
        layout.minimumInteritemSpacing = 5
        let temp = UICollectionView(frame: .zero, collectionViewLayout: layout)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .clear
        temp.delegate = self
        temp.dataSource = self
        temp.showsHorizontalScrollIndicator = false
        temp.register(UINib(nibName: CastCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CastCollectionViewCell.identifier)
        return temp
    }()
    
    private lazy var titleLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = .systemFont(ofSize: 28, weight: .black)
        temp.textColor = .almostBlack
        temp.text = ""
        return temp
    }()
    
    override func addViewComponents() {
        super.addViewComponents()
        backgroundColor = .clear
        contentView.addSubview(collectionView)
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.top.equalToSuperview()
        }
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setData(with data: CastCardViewData?) {
        guard let data = data else {return}
        self.data = data
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.titleLabel.text = data.title
        }
    }
}

// MARK: CollectionView Delegates
extension CastCardView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let data = data else {return 0}
        return data.items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastCollectionViewCell.identifier, for: indexPath) as? CastCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        guard let data = data, let cellData = data.items?[indexPath.row] as? CastCollectionViewCellData else {
            return UICollectionViewCell()
        }

        cell.setData(from: cellData)
        return cell
    }
    
    
}
