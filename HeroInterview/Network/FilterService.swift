//
//  FilterService.swift
//  HeroInterview
//
//  Created by Nicolas CHARVOZ on 16/01/2019.
//  Copyright © 2019 Nicolas Charvoz. All rights reserved.
//

import Foundation

protocol FilterServiceDelegate: class {
    func didSelectCell(withType type: FilterService.FilterType)
}

final class FilterService {
    public enum FilterType: String, CaseIterable {
        case reset = "Reset"
        case alphaAZ = "Alphabetically (A-Z)"
        case alphaZA = "Alphabetically (Z-A)"
        case size = "Size"
        case hasImage = "With Image"
    }
}
