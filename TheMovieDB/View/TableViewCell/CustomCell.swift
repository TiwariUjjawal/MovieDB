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
    
    var movieData: MovieModel?
    
//    init(movieData: MovieModel){
//        self.movieData = movieData
//        super.init()
//    }
    
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    func setProperties() {
        titleLabel.text = movieData?.title ?? ""
        popularityLabel.text = "Popularity: " + String((movieData?.popularity ?? 0))
        releaseLabel.text = ("Release Date: " + (movieData?.release_date  ?? ""))
//        print(movieData?.title ?? "")
//        print("Popularity: " + String((movieData?.popularity ?? 0)))
//        print("Release Date: " + (movieData?.release_date  ?? ""))
        let urlImage = URL(string: Constant.image_base_url.rawValue + ((movieData?.backdrop_path) ?? ""))
//            print(urlImage)
            DispatchQueue.global().async {
              let data = try? Data(contentsOf: urlImage!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
              DispatchQueue.main.async {
                self.photoView.image = UIImage(data: data!)
              }
            }
    }
}
