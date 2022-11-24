//
//  PicsumPhotoTableViewCell.swift
//  Homework8 @SergeyHots
//
//  Created by Macbook on 22.11.2022.
//

import UIKit

class PicsumPhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with element: Picsum) {
        numberLabel.text = element.id
        authorLabel.text = element.author
        photoImageView.downloaded(from: element.downloadURL,
                                  contentMode: .scaleAspectFill)
    }
    
}
