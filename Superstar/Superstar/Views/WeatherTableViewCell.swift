//
//  WeatherTableViewCell.swift
//  Superstar
//
//  Created by Aruzhan Zhakhan on 23.10.2022.
//

import UIKit
import SnapKit

class WeatherTableViewCell: UITableViewCell {
    
    lazy private var cellBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = CGColor(red: 0, green: 0, blue: 255, alpha: 0)
        return view
    }()
    
    lazy private var myLabel: UILabel = {
        let label = UILabel()
        label.text = "Aruzhan"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        
        setupViews()
        setupConstraints()
    }
    convenience init(with tableView: Bool, style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.init(style: style, reuseIdentifier: reuseIdentifier)
        switch tableView{
        case true: return
        case false: return
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setText(with content: String){
        myLabel.text = content
    }
    
}

private extension WeatherTableViewCell{
    private func setupViews(){
        contentView.addSubview(cellBackground)
        cellBackground.addSubview(myLabel)
    }
    private func setupConstraints(){
        cellBackground.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        myLabel.snp.makeConstraints{make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
}

