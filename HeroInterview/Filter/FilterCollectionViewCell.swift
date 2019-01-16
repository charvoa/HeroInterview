//
//  FilterCollectionViewCell.swift
//  HeroInterview
//
//  Created by Nicolas CHARVOZ on 16/01/2019.
//  Copyright © 2019 Nicolas Charvoz. All rights reserved.
//

import UIKit
import Reusable

class FilterCollectionViewCell: UICollectionViewCell, NibReusable {

    private lazy var textLayer: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(withViewModel viewModel: FilterViewModel) {
        backgroundColor = viewModel.backgroundColor

        layer.masksToBounds = true
        layer.cornerRadius = 10.0
        
        setupLabel()
        textLayer.textColor = viewModel.textColor
        textLayer.text = viewModel.title
        textLayer.textAlignment = .center
    }
}

private extension FilterCollectionViewCell {
    func setupLabel() {
        addSubview(textLayer)

        textLayer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textLayer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        textLayer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        textLayer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
