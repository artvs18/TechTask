//
//  Latest.swift
//  TechTask
//
//  Created by Artemy Volkov on 18.03.2023.
//

import Foundation

struct Latest: Decodable {
    let items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case items = "latest"
    }
    
    struct Item: Decodable, Identifiable {
        let id = UUID()
        let category, name: String
        let price: Int
        let imageURL: String
        
        enum CodingKeys: String, CodingKey {
            case category, name, price
            case imageURL = "image_url"
        }
    }
}
