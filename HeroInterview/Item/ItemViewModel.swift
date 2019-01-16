//
//  ItemViewModel.swift
//  HeroInterview
//
//  Created by Nicolas CHARVOZ on 16/01/2019.
//  Copyright © 2019 Nicolas Charvoz. All rights reserved.
//

import Foundation

final class ItemViewModel {
    var brandName: String?
    var brandNameHidden: Bool = false
    var name: String?
    var nameHidden: Bool = false
    var size: String?
    var sizeHidden: Bool = false
    var imageFirst: String

    init(fromModel model: ItemModel) {
        brandName = model.brandName
        if brandName == nil { brandNameHidden = true }
        name = model.name
        if name == nil { nameHidden = true }
        size = model.size
        if size == nil { sizeHidden = true }

        if let images = model.images, images.count > 1 {
            imageFirst = images[0]
        } else {
            imageFirst = "https://picsum.photos/500/500/?random"
        }
    }
}
