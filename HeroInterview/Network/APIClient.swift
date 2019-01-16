//
//  APIClient.swift
//  HeroInterview
//
//  Created by Nicolas CHARVOZ on 16/01/2019.
//  Copyright © 2019 Nicolas Charvoz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol TestableAPI: class {
    var baseURL: URL? { get set }

    func setup(withURL urlString: String)
    func get(_ path: String, completion: @escaping (JSON?, Error?) -> Void)
}

final class APIClient: NSObject, TestableAPI {
    var baseURL: URL?

    static let shared = APIClient()

    private override init() {
        super.init()
    }

    func setup(withURL urlString: String) {
        self.baseURL = URL(string: urlString)
    }
}

extension APIClient {
    internal func get(_ path: String, completion: @escaping (JSON?, Error?) -> Void) {
        guard let finalURL = baseURL?.appendingPathComponent(path) else {
            completion(nil, nil)
            return
        }

        Alamofire.request(finalURL, method: .get, parameters: [:])
            .validate(statusCode: 200..<300)
            .responseJSON { responseJSON in
                switch responseJSON.result {
                case .success:
                    guard
                        let result = responseJSON.result.value else {
                            completion(nil, nil)
                            return
                    }
                    completion(JSON(result), nil)
                case .failure(let error):
                    completion(nil, error)
                }
        }
    }
}

final class APIClient_Testable: TestableAPI {
    var baseURL: URL?

    static let shared = APIClient_Testable()

    func setup(withURL urlString: String) {
        baseURL = URL(string: urlString)
    }

    func get(_ path: String, completion: @escaping (JSON?, Error?) -> Void) {
        completion(JSON(mockResult), nil)
    }
}
