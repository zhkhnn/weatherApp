//
//  WeatherTableViewHeaderView.swift
//  Superstar
//
//  Created by Aruzhan Zhakhan on 29.10.2022.
//

import UIKit
import SnapKit



class WeatherTableViewHeaderView: UITableViewHeaderFooterView {
    
    var weatherManager:WeatherManager?
    
    lazy private var cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .white

        return label
    }()
    lazy private var degreeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 70)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    lazy private var weatherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .white

        return label
    }()
    lazy private var highlowLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .white

        return label
    }()
    
    

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        changeAllTextColors(with: .white)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func changeAllTextColors(with color:UIColor){
        let subviews = contentView.subviews
        for subview in subviews{
            if subview is UILabel{
                let currentLabel = subview as! UILabel
                currentLabel.textColor = color
            }
        }
    }
    
}

extension WeatherTableViewHeaderView: WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, with model: WeatherModel) {
        DispatchQueue.main.async {
            self.cityLabel.text = model.cityName
            self.degreeLabel.text = " \(Int(model.temp))°"
            self.weatherLabel.text = model.description.capitalized
            self.highlowLabel.text = "H:\(Int(model.highT))° L:\(Int(model.lowT))°"
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}

private extension WeatherTableViewHeaderView{
    func setupViews(){
        contentView.addSubview(cityLabel)
        contentView.addSubview(degreeLabel)
        contentView.addSubview(weatherLabel)
        contentView.addSubview(highlowLabel)
    }
    func setupConstraints(){
        cityLabel.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(degreeLabel.snp.top)
        }
        degreeLabel.snp.makeConstraints{make in
            make.center.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.34)
        }
        weatherLabel.snp.makeConstraints{make in
            make.top.equalTo(degreeLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        highlowLabel.snp.makeConstraints{make in
            make.top.equalTo(weatherLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
}
