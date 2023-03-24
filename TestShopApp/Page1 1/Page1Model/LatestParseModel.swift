//
//  Page1ParseModel.swift
//  TestShopApp
//
//  Created by Артем Манасян on 13.03.2023.
//

import Foundation


struct LatestParseModel: Codable {
    let latest: [LatestObjectParseModel]
    
    enum CodingKeys: String, CodingKey {
        case latest
    }
}



struct LatestObjectParseModel: Codable {
    let category: String
    let name: String
    let price: Int
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageUrl = "image_url"
    }
}
