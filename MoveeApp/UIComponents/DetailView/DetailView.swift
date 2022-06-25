//
//  DetailView.swift
//  MoveeApp
//
//  Created by Can Yoldaş on 25.06.2022.
//

import UIKit
import CYBase

struct DetailViewData {
    
    private(set) var viewData: [CYDataProtocol]
}

class DetailView: CYBaseView<DetailViewData> {
    
    private lazy var tableView: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.dataSource = self
        temp.delegate = self
        temp.contentInsetAdjustmentBehavior = .never
        temp.allowsSelection = false
        temp.backgroundColor = .clear
        temp.estimatedRowHeight = UITableView.automaticDimension
        temp.register(DetailViewCell.self, forCellReuseIdentifier: DetailViewCell.identifier)
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
        return data.viewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = returnData(),
              let cell = tableView.dequeueReusableCell(withIdentifier: DetailViewCell.identifier) as? DetailViewCell
        else {
            return UITableViewCell()
        }
        cell.setData(data: data.viewData[indexPath.row])
        return cell
    }
}
