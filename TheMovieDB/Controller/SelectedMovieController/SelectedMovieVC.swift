//
//  SelectedMovieVC.swift
//  TheMovieDB
//
//  Created by UT on 25/08/21.
//

import UIKit

class SelectedMovieVC: UIViewController {
    
    var movieData: MovieModel?
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = movieData?.title ?? ""
        popularityLabel.text = "Popularity: " + String((movieData?.popularity ?? 0))
        releaseLabel.text = ("Release Date: " + (movieData?.release_date  ?? ""))
        
        let urlImage = URL(string: Constant.image_base_url.rawValue + ((movieData?.backdrop_path) ?? ""))
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: urlImage!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.photoView.image = UIImage(data: data!)
            }
        }
    }
}
