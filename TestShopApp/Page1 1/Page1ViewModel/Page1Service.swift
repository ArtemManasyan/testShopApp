//
//  Page1Service.swift
//  TestShopApp
//
//  Created by Артем Манасян on 14.03.2023.
//

import Foundation

import Foundation
import Alamofire
import Kingfisher

class Page1Service {
    
    private let latestURL = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
    private let flashSalesURL = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
    
    func getLatestObjects(completion: ((LatestParseModel) -> Void)?) {
        AF.request(latestURL, method: .get).responseDecodable(of: LatestParseModel.self) { response in
            switch response.result {
            case let .success (latestModel):
                print(latestModel)
                completion?(latestModel)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func getFlashSales(completion: ((FlashSaleParseModel) -> Void)?) {
        AF.request(flashSalesURL, method: .get).responseDecodable(of: FlashSaleParseModel.self) { response in
            switch response.result {
            case let .success (flashSaleModel):
                print(flashSaleModel)
                completion?(flashSaleModel)
            case let .failure(error):
                print(error)
            }
        }
    }
    
}
