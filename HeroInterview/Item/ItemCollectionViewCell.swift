//
//  ItemCollectionViewCell.swift
//  HeroInterview
//
//  Created by Nicolas CHARVOZ on 16/01/2019.
//  Copyright © 2019 Nicolas Charvoz. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

class ItemCollectionViewCell: UICollectionViewCell, NibReusable {

    @IBOutlet private var label2: UILabel!
    @IBOutlet private var label1: UILabel!
    @IBOutlet private var label0: UILabel!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var bgView: UIView!
    @IBOutlet private var blurView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(withViewModel viewModel: ItemViewModel) {
        bgView.backgroundColor = .clear

        configureLabel(label0, withContent: viewModel.brandName, isHidden: viewModel.brandNameHidden)
        configureLabel(label1, withContent: viewModel.name, isHidden: viewModel.nameHidden)
        configureLabel(label2, withContent: viewModel.size, isHidden: viewModel.sizeHidden)

        blurView.backgroundColor = .black
        blurView.alpha = 0.5

        imageView.contentMode = .scaleAspectFill
        imageView.kf.setImage(with: URL(string: viewModel.imageFirst), placeholder: UIImage())
    }

    override func prepareForReuse() {
        label0.isHidden = false
        label1.isHidden = false
        label2.isHidden = false
    }
}

private extension ItemCollectionViewCell {
    func configureLabel(_ label: UILabel, withContent content: String?, isHidden: Bool) {
        label.text = content
        label.numberOfLines = 0
        label.isHidden = isHidden
        label.textColor = .white
    }
}
