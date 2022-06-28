//
//  DetailView.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 25.06.2022.
//

import UIKit
import CYBase

struct DetailViewData {
    
    private(set) var detailData: [CYDataProtocol]
    private(set) var castData: [CastCardViewData]
}

class DetailView: CYBaseView<DetailViewData> {
    
    enum TableSections {
        case detail
        case casts
    }
    
    let sections: [TableSections] = [.detail, .casts]
    
    private lazy var tableView: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.dataSource = self
        temp.delegate = self
        temp.contentInsetAdjustmentBehavior = .never
        temp.allowsSelection = false
        temp.backgroundColor = .clear
        temp.separatorStyle = .none
        temp.estimatedRowHeight = UITableView.automaticDimension
        temp.register(DetailViewCell.self, forCellReuseIdentifier: DetailViewCell.identifier)
        temp.register(CastCardView.self, forCellReuseIdentifier: CastCardView.identifier)
        return temp
    }()
        
    override func setupViews() {
        super.setupViews()
        addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension DetailView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = returnData() else {return 0}
        
        
        let section = sections[section]
        
        switch section {
        case .detail:
            return data.detailData.count
        case .casts:
            return data.castData.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = returnData() else {return UITableViewCell() }
        let section = sections[indexPath.section]
        
        switch section {
            case .detail:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailViewCell.identifier) as? DetailViewCell
                else {
                    return UITableViewCell()
                }
                cell.setData(data: data.detailData[indexPath.row])
                return cell
        case .casts:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CastCardView.identifier) as? CastCardView else {
                return UITableViewCell()
            }
            cell.setData(with: data.castData[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let section = sections[indexPath.section]
        
        switch section {
        case .casts:
            return 200
        default:
            break
        }
        return UITableView.automaticDimension
    }
}
