//
//  CardCastView.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 25.06.2022.
//

import UIKit
import CYBase

struct CastCardViewData {
    let items: [CYDataProtocol]?
}

class CastCardView: CYBaseView<CastCardViewData> {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let temp = UICollectionView(frame: .zero, collectionViewLayout: layout)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .clear
        temp.delegate = self
        temp.dataSource = self
        temp.isUserInteractionEnabled = true
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
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(collectionView)
        addSubview(titleLabel)
        
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
    
    override func loadDataToView() {
        super.loadDataToView()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

// MARK: CollectionView Delegates
extension CastCardView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let data = returnData() else {return 0}
        return data.items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastCollectionViewCell.identifier, for: indexPath) as? CastCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        guard let data = returnData(), let cellData = data.items?[indexPath.row] as? CastCollectionViewCellData else {
            return UICollectionViewCell()
        }

        cell.setData(from: cellData)
        return cell
    }
}
