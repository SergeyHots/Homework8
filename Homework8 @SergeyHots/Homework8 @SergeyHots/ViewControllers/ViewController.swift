//
//  ViewController.swift
//  Homework8 @SergeyHots
//
//  Created by Macbook on 20.11.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = Bundle.main.url(forResource: "RawData",
                                        withExtension: "json") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(ModelName.self, from: data)
            print(jsonData.listOfData)
        } catch {
            print("error:\(error)")
        }
    }

}

// MARK: - parsing JSON
//po jsonData.companyDescription
//po jsonData.listOfData.first?.modelNumber
//po jsonData.listOfData.first?.countries.last
//po jsonData.listOfData.last?.price.regions.first?.name
//po jsonData.listOfData.last?.price.regions.last?.price
