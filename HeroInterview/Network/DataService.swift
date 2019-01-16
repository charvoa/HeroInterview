//
//  DataService.swift
//  HeroInterview
//
//  Created by Nicolas CHARVOZ on 16/01/2019.
//  Copyright © 2019 Nicolas Charvoz. All rights reserved.
//

import Foundation

final class DataService {

    private var items = [ItemModel]()
    private var sortedItems: [ItemModel]?
    public var currentItems: [ItemModel] {
        return sortedItems ?? items
    }

    public let filterService = FilterService()

    private let apiClient: TestableAPI

    init(withAPIClient apiClient: TestableAPI) {
        self.apiClient = apiClient
    }

    func fetchItems(completion: @escaping (Bool) -> Void) {
        apiClient.get("/items") { [weak self] (json, error) in
            guard error == nil, let sJson = json else {
                completion(false)
                return
            }

            for obj in sJson {
                self?.items.append(ItemModel(withObject: obj.1))
            }

            completion(true)
        }
    }

    func getItems(for type: FilterService.FilterType) {
        switch type {
        case .alphaAZ:
            sortedItems = items.sorted { ($0.name ?? "") < ($1.name ?? "") }
        case .alphaZA:
            sortedItems = items.sorted { ($0.name ?? "") > ($1.name ?? "") }
        case .size:
            sortedItems = items.sorted { ($0.size ?? "") < ($1.size ?? "") }
        case .hasImage:
            sortedItems = items.filter { return $0.images != nil }
        case .reset:
            sortedItems = nil
        }
    }
}
