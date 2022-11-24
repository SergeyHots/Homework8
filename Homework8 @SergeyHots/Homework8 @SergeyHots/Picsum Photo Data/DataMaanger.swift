//
//  DataMaanger.swift
//  Homework8 @SergeyHots
//
//  Created by Macbook on 24.11.2022.
//

import Foundation

struct DataManager {
    
    func getListOfPersons() -> [Picsum] {
        
        guard let url = Bundle.main.url(forResource: "PicsumJSON", withExtension: "json") else { return [] }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(PicsumElement.self, from: data)
        } catch {
            fatalError("Whoops :D ")
        }
    }
}
