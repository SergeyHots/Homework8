//
//  PicsumViewController.swift
//  Homework8 @SergeyHots
//
//  Created by Macbook on 22.11.2022.
//

import UIKit
import Alamofire

class PicsumViewController: UIViewController {

    @IBOutlet weak var picsumPhotoTableView: UITableView!
    
    var arrayOfImages: [Picsum] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "PicsumPhotoTableViewCell", bundle: nil)
        self.picsumPhotoTableView.register(nib, forCellReuseIdentifier: "PicsumPhotoTableViewCell")
        
        let request = AF.request("https://picsum.photos/v2/list?page=2&limit=100", method: .get)
        
        request.responseDecodable(of: PicsumElement.self) { response in
            
            do {
                self.arrayOfImages = try response.result.get()
                self.picsumPhotoTableView.reloadData()
            } catch {
                print("Error response")
            }
        }
        
//        arrayOfImages = DataManager().getListOfPersons()
//        picsumPhotoTableView.reloadData()
    }

}

extension PicsumViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrayOfImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = picsumPhotoTableView.dequeueReusableCell(withIdentifier: "PicsumPhotoTableViewCell") as! PicsumPhotoTableViewCell
        cell.configure(with: arrayOfImages[indexPath.row])
        return cell
    }
    
    
}
