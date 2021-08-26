//
//  SelectedMovieVC.swift
//  TheMovieDB
//
//  Created by UT on 25/08/21.
//

import UIKit

class SelectedMovieVC: UIViewController {
    
    var titleRecieved: String? = ""
    var popularityRecieved: String? = ""
    var releaseRecieved: String? = ""
    var imageURLRecieved: String? = ""

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleRecieved
        popularityLabel.text = popularityRecieved
        releaseLabel.text = releaseRecieved
        
        let urlImage = URL(string: Constant.image_base_url.rawValue + (imageURLRecieved ?? ""))
            DispatchQueue.global().async {
              let data = try? Data(contentsOf: urlImage!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
              DispatchQueue.main.async {
                self.photoView.image = UIImage(data: data!)
              }
            }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
