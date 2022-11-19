//
//  GenreMovieModels.swift
//  Homework8 @SergeyHots
//
//  Created by Macbook on 20.11.2022.
//

import Foundation

// MARK: - GenreMovie
struct GenreMovie: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}
