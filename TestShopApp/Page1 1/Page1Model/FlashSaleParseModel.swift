//
//  FlashSaleParseModel.swift
//  TestShopApp
//
//  Created by Артем Манасян on 14.03.2023.
//

import Foundation

struct FlashSaleParseModel: Codable {
    let flashSale: [FlashParse]
    
    enum CodingKeys: String, CodingKey {
        case flashSale = "flash_sale"
    }
}

struct FlashParse: Codable {
    let category: String
    let name: String
    let price: Double
    let discount: Int
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case category, name, price, discount
        case image = "image_url"
    }
}
