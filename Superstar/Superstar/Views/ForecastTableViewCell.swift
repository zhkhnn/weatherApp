//
//  ForecastTableViewCell.swift
//  Superstar
//
//  Created by Aruzhan Zhakhan on 03.11.2022.
//

import UIKit
import SnapKit

class ForecastTableViewCell: UITableViewCell {
    
    lazy private var dayLabel: UILabel = {
        let label = UILabel()
        label.text = "Today"
        return label
    }()
    lazy private var conditionImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "cloud")
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        return image
    }()
    lazy private var degreeHighLabel: UILabel = {
        let label = UILabel()
        label.text = " 28°"
        return label
    }()
    lazy private var rowLabel: UILabel = {
        let label = UILabel()
        label.text = "---------"
        return label
    }()
    lazy private var degreeLowLabel: UILabel = {
        let label = UILabel()
        label.text = " 18°"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        changeLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func changeLabel(){
        let subviews = contentView.subviews
        for subview in subviews{
            if subview is UILabel{
                let currentLabel = subview as! UILabel
                currentLabel.textAlignment = .center
                currentLabel.textColor = .white
            }
        }
    }
}
private extension ForecastTableViewCell{
    func setupViews(){
        contentView.addSubview(dayLabel)
        contentView.addSubview(conditionImage)
        contentView.addSubview(degreeLowLabel)
        contentView.addSubview(rowLabel)
        contentView.addSubview(degreeHighLabel)

    }
    func setupConstraints(){
        dayLabel.snp.makeConstraints{make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.15)
        }
        conditionImage.snp.makeConstraints{make in
            make.leading.equalTo(dayLabel.snp.trailing)
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.1)
        }
        degreeLowLabel.snp.makeConstraints{make in
            make.leading.equalTo(conditionImage.snp.trailing)
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.15)
        }
        rowLabel.snp.makeConstraints{make in
            make.leading.equalTo(degreeLowLabel.snp.trailing)
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        degreeHighLabel.snp.makeConstraints{make in
            make.leading.equalTo(rowLabel.snp.trailing)
            make.top.bottom.trailing.equalToSuperview()
        }
    }
}
