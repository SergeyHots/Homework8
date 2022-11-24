//
//  PicsumModels.swift
//  Homework8 @SergeyHots
//
//  Created by Macbook on 22.11.2022.
//

import Foundation

// MARK: - Picsum
struct Picsum: Codable {
    let id, author: String
    let width, height: Int
    let url, downloadURL: String

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}

typealias PicsumElement = [Picsum]
