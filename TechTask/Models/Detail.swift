//
//  Detail.swift
//  TechTask
//
//  Created by Artemy Volkov on 21.03.2023.
//

struct Detail: Decodable {
    let name: String
    let description: String
    let rating: Double
    let numberOfReviews: Int
    let price: Int
    let colors: [String]
    let imageUrls: [String]

    enum CodingKeys: String, CodingKey {
        case name, description, rating, price, colors
        case numberOfReviews = "number_of_reviews"
        case imageUrls = "image_urls"
    }
}
