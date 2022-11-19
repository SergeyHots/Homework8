//
//  Models.swift
//  Homework8 @SergeyHots
//
//  Created by Macbook on 20.11.2022.
//

import Foundation

struct ModelName: Codable {
    var count: Int
    var companyDescription: String
    var listOfData: [ListOfDatum]
}

struct ListOfDatum: Codable {
    var name: String
    var modelNumber: String
    var countries: [String]
    var price: Price
    var year: Int
}

struct Price: Codable {
    var regions: [Region]
}

struct Region: Codable {
    var name: String
    var price: Int
}
