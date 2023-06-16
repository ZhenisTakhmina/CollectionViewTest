//
//  ViewController.swift
//  collectionView
//
//  Created by Tami on 12.06.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    // MARK: - State
    private let categoryName: [String] = ["most popular", "suchi", "burger","rolls","pizza","asian", "burgers" ]
    
    // MARK: - UI
    private lazy var hrCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout())
        collection.backgroundColor = .none
        collection.bounces = false
        collection.showsHorizontalScrollIndicator = false
        
        collection.delegate = self
        collection.dataSource = self
        collection.register(HrCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.selectItem(at: [0,0], animated: true, scrollPosition: [])
        return collection
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func layout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        return layout
    }
    
    // MARK: - Setup Views
    private func setupViews() {
        view.backgroundColor = .lightGray
        view.addSubview(hrCollectionView)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        hrCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoryName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HrCollectionViewCell else { return UICollectionViewCell() }
        cell.name.text = categoryName[indexPath.item]
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let categoryFont = UIFont(name: "Arial", size: 16)
        let categoryAttribuites = [NSAttributedString.Key.font : categoryFont as Any]
        let categoryWidth = categoryName[indexPath.item].size(withAttributes: categoryAttribuites).width + 30
        return CGSize(width: categoryWidth, height: collectionView.frame.height )
    }
}

