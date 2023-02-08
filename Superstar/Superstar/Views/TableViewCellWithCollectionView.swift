//
//  TableViewCellWithCollectionView.swift
//  Superstar
//
//  Created by Aruzhan Zhakhan on 01.11.2022.
//

import UIKit
import SnapKit

final class TableViewCellWithCollectionView: UITableViewCell {
    
    lazy private var actualWeatherCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 75, height: 100)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.collectionViewCell)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    lazy private var backgroundBlurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = contentView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        
        actualWeatherCollectionView.dataSource = self
        actualWeatherCollectionView.delegate = self
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension TableViewCellWithCollectionView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.collectionViewCell, for: indexPath)
        return cell
    }
}

extension TableViewCellWithCollectionView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 75, height: 100)
    }
}

private extension TableViewCellWithCollectionView{
    private func setupViews(){
        contentView.addSubview(backgroundBlurEffectView)
        contentView.addSubview(actualWeatherCollectionView)
    }
    private func setupConstraints(){
        backgroundBlurEffectView.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
        actualWeatherCollectionView.snp.makeConstraints{make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
}


