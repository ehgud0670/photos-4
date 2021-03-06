//
//  DoodleImageManager.swift
//  PhotosApp
//
//  Created by kimdo2297 on 2020/03/19.
//  Copyright © 2020 jinie. All rights reserved.
//

import UIKit

final class DoodleImageManager {
    func downloadImage(urlString: String, completionHandler: @escaping (UIImage?) -> ()) {
        NetworkManager.excuteURLSession(from: urlString) { (data) in
            guard let imageData = data,
                let image = UIImage(data: imageData) else { return }
            completionHandler(image)
        }
    }
}
