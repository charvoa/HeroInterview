//
//  CustomUICollectionViewFlowLayout.swift
//  HeroInterview
//
//  Created by Nicolas CHARVOZ on 16/01/2019.
//  Copyright © 2019 Nicolas Charvoz. All rights reserved.
//

import Foundation
import UIKit

final class CustomUICollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()

        let itemSpacing: CGFloat = 3
        let itemsInOneLine: CGFloat = 2
        let width = UIScreen.main.bounds.size.width - itemSpacing * CGFloat(itemsInOneLine - 1)

        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        scrollDirection = .vertical
        itemSize = CGSize(width: floor(width/itemsInOneLine), height: width/itemsInOneLine)
        minimumInteritemSpacing = 3
        minimumLineSpacing = 3
    }
}

final class FilterCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        let width = UIScreen.main.bounds.size.width / 2

        sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        scrollDirection = .horizontal
        itemSize = CGSize(width: width, height: 40)
        minimumInteritemSpacing = 5
        minimumLineSpacing = 5
    }
}
