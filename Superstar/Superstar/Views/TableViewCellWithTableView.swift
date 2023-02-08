//
//  TableViewCellWithTableView.swift
//  Superstar
//
//  Created by Aruzhan Zhakhan on 01.11.2022.
//

import UIKit
import SnapKit
final class TableViewCellWithTableView: UITableViewCell {
    
    lazy private var forecastTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.forecastTableView)
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 20
        forecastTableView.dataSource = self
        forecastTableView.delegate = self
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
extension TableViewCellWithTableView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.forecastTableView, for: indexPath) as! ForecastTableViewCell
        cell.backgroundColor = .clear
        return cell
    }
    
    
}
extension TableViewCellWithTableView: UITableViewDelegate{
    
}
private extension TableViewCellWithTableView{
    private func setupViews(){
        contentView.addSubview(forecastTableView)
    }
    private func setupConstraints(){
        
        forecastTableView.snp.makeConstraints{make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
}

