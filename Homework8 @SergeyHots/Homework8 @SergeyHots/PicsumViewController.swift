//
//  PicsumViewController.swift
//  Homework8 @SergeyHots
//
//  Created by Macbook on 22.11.2022.
//

import UIKit

class PicsumViewController: UIViewController {

    @IBOutlet weak var picsumPhotoTableView: UITableView!
    
    var arrayOfImages: [Picsum] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "PicsumPhotoTableViewCell", bundle: nil)
        self.picsumPhotoTableView.register(nib, forCellReuseIdentifier: "PicsumPhotoTableViewCell")
        
        arrayOfImages = DataManager().getListOfPersons()
        picsumPhotoTableView.reloadData()
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
