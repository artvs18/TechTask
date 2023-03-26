//
//  FlashSale.swift
//  TechTask
//
//  Created by Artemy Volkov on 18.03.2023.
//

import Foundation

struct FlashSale: Decodable {
    let items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case items = "flash_sale"
    }
    
    struct Item: Decodable, Identifiable {
        let id = UUID()
        let category: String
        let name: String
        let price: Double
        let discount: Int
        let imageURL: String
        
        enum CodingKeys: String, CodingKey {
            case category, name, price, discount
            case imageURL = "image_url"
        }
    }
}
