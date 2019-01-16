//
//  FilterViewModel.swift
//  HeroInterview
//
//  Created by Nicolas CHARVOZ on 16/01/2019.
//  Copyright © 2019 Nicolas Charvoz. All rights reserved.
//

import Foundation
import UIKit

final class FilterViewModel {
    var title: String
    var backgroundColor: UIColor
    var textColor: UIColor

    init(withType type: FilterService.FilterType) {
        title = type.rawValue
        backgroundColor = UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0)
        if type == .reset {
            backgroundColor = UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1.0)
        }
        textColor = .white
    }
}
