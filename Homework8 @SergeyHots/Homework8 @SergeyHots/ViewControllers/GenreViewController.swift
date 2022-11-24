//
//  GenreViewController.swift
//  Homework8 @SergeyHots
//
//  Created by Macbook on 22.11.2022.
//

import UIKit
import Alamofire

class GenreViewController: UIViewController {

    @IBOutlet weak var genreTableView: UITableView!
    
    var arrayOfGenreMovies: [Genre] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let request = AF.request("https://api.themoviedb.org/3/genre/movie/list?api_key=8fb052fd2560b36b942c9ca9ca8ad09d&language=en-US", method: .get)
        
        request.responseDecodable(of: GenreMovie.self) { response in
            
            do {
                self.arrayOfGenreMovies = try response.result.get().genres
                self.genreTableView.reloadData()
            } catch {
                print("Error response")
            }
        }
    }

}

extension GenreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrayOfGenreMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = arrayOfGenreMovies[indexPath.row].name
        return cell
    }
    
    
}
