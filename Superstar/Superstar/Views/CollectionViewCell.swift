//
//  CollectionViewCell.swift
//  Superstar
//
//  Created by Aruzhan Zhakhan on 02.11.2022.
//

import UIKit
import SnapKit
class CollectionViewCell: UICollectionViewCell {
    lazy private var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Now"
        return label
    }()
    lazy private var conditionImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "cloud")
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        return image
    }()
    lazy private var degreeLabel: UILabel = {
        let degree = UILabel()
        degree.text = " 58°"
        return degree
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
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
private extension CollectionViewCell{
    func setupViews(){
        contentView.addSubview(timeLabel)
        contentView.addSubview(conditionImage)
        contentView.addSubview(degreeLabel)
        
    }
    func setupConstraints(){
        timeLabel.snp.makeConstraints{make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.33)
        }
        conditionImage.snp.makeConstraints{make in
            make.top.equalTo(timeLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.34)
        }
        degreeLabel.snp.makeConstraints{make in
            make.top.equalTo(conditionImage.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
    }
}
