//
//  HrCollectionViewCell.swift
//  collectionView
//
//  Created by Tami on 12.06.2023.
//

import UIKit

class HrCollectionViewCell: UICollectionViewCell {
    
    let name: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override var isSelected: Bool {
        didSet{
            contentView.backgroundColor = self.isSelected ? .blue : .red
            name.textColor = self.isSelected ? .white : .black
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.backgroundColor = .red
        contentView.layer.cornerRadius = 14
        contentView.addSubview(name)
    }
    
    func setConstraints() {
        name.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
