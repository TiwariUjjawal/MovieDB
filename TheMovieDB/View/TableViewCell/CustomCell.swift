//
//  CustomCell.swift
//  TheMovieDB
//
//  Created by UT on 25/08/21.
//

import UIKit

// Custom Cell which will be attached to table view's cell.

/// A Custom Cell which contains fields to set for a Movie.
class CustomCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
