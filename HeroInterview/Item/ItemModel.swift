//
//  ItemModel.swift
//  HeroInterview
//
//  Created by Nicolas CHARVOZ on 16/01/2019.
//  Copyright © 2019 Nicolas Charvoz. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol Item: class {
    var brandName: String? { get set }
    var name: String? { get set }
    var size: String? { get set }
    var images: [String]? { get set }
}

final class ItemModel: Item {
    var brandName: String?
    var name: String?
    var size: String?
    var images: [String]?

    init(withObject obj: JSON) {
        brandName = obj["brand_name"].string
        name = obj["name"].string
        size = obj["size"].string
        images = obj["images"].arrayObject as? [String]
        if images?.isEmpty == true {
            images = nil
        }
    }
}
