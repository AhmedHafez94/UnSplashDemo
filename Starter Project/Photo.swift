//
//  Photo.swift
//  Starter Project
//
//  Created by Ahmed Hafez on 4/1/23.
//

import Foundation

struct Photo: Codable {
    let id: String?
    let width, height: Int?
    let likes: Int?
    let description: String?
    let urls: Urls?
    
    enum CodingKeys: String, CodingKey {
        case id
        case width, height
        case likes
        case description
        case urls
    }
}


struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb: String
}
