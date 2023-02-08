//
//  ViewController.swift
//  Superstar
//
//  Created by Aruzhan Zhakhan on 22.10.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var weatherManager = WeatherManager()
    
    lazy private var sectionNames: [String] = ["Windy conditions from 3pm-5pm, with heavy snow expected at 6pm", "7-day forecast"]
    
    lazy private var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ios")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var weatherTableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        let headerView = WeatherTableViewHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 275))
//        headerView.weatherManager = self().weatherManager
        tableView.tableHeaderView = headerView
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 20
        tableView.allowsSelection = false
//        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.WeatherTableView)
//        tableView.register(WeatherTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: Constants.Identifiers.WeatherTableViewHeaderView)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        weatherManager.delegate = weatherTableView.tableHeaderView as? any WeatherManagerDelegate
        setupViews()
        setupConstraints()
        weatherManager.fetchRequest()
        

    }
    
    func setupViews(){
        view.addSubview(backgroundImageView)
        view.addSubview(weatherTableView)
    }
    
    func setupConstraints(){
        backgroundImageView.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
        weatherTableView.snp.makeConstraints{make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(10)
            make.leading.trailing.bottom.equalToSuperview().inset(25)
        }
        
        
        
    }
}
    
    
extension ViewController: UITableViewDataSource{
        func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return 1
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            switch indexPath.section{
            case 0: let cell = TableViewCellWithCollectionView()
                cell.backgroundColor = .clear
                return cell
            case 1: let cell = TableViewCellWithTableView()
                cell.backgroundColor = .clear
                return cell
            default:
                return UITableViewCell()
        }
            
        }
        
    }

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionNames[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .white
        }
    }
}
