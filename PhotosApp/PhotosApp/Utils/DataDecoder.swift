//
//  DataDecoder.swift
//  PhotosApp
//
//  Created by kimdo2297 on 2020/03/19.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation

final class DataDecoder {
    static func decodeJSONData<T>(from urlString: String,
                                  type: T.Type,
                                  dateDecodingStrategy: JSONDecoder.DateDecodingStrategy?,
                                  completionHandler: @escaping (T?) -> ())
        where T: Decodable {
            NetworkManager.excuteURLSession(from: urlString) { (data) in
                guard let data = data else { return }
                do {
                    let jsonDecoder: JSONDecoder = {
                        let jsonDecoder = JSONDecoder()
                        if let dateDecodingStrategy = dateDecodingStrategy {
                            jsonDecoder.dateDecodingStrategy = dateDecodingStrategy
                        }
                        return jsonDecoder
                    }()
                    let T = try jsonDecoder.decode(T.self, from: data)
                    completionHandler(T)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
    }
}
