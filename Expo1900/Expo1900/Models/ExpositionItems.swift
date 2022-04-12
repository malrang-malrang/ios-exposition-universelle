//
//  expositionItems.swift
//  Expo1900
//
//  Created by 고명주 on 2022/04/12.
//

import Foundation
import UIKit

struct ExpositionItems: Codable {
    let name: String?
    let imageName: String?
    let shortDescription: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
    
    static func parse() -> [ExpositionItems]? {
        guard let asset = NSDataAsset(name: "items") else {
            return nil
        }
        let expositionItems = try? JSONDecoder().decode([ExpositionItems].self, from: asset.data)
        return expositionItems
    }
}
