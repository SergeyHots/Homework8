//
//  MoviesViewController.swift
//  Homework8 @SergeyHots
//
//  Created by Macbook on 21.11.2022.
//

import UIKit
import Alamofire

class MoviesViewController: UIViewController {

    @IBOutlet weak var moviesTableView: UITableView!
    
    var arrayOfMovies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let request = AF.request("https://api.themoviedb.org/3/trending/movie/week?api_key=8fb052fd2560b36b942c9ca9ca8ad09d", method: .get)
        
        request.responseDecodable(of: TMDBResponse.self) { response in
            
            do {
                self.arrayOfMovies = try response.result.get().results
                self.moviesTableView.reloadData()
            } catch {
                print("Error response")
            }
        }
    }
}

extension MoviesViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrayOfMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = arrayOfMovies[indexPath.row].originalTitle
        return cell
    }
    
    
}
