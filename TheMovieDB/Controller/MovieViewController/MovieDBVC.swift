//
//  ViewController.swift
//  TheMovieDB
//
//  Created by UT on 25/08/21.
//

import UIKit

class MovieDBVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    //MARK: DataSource For TableVIew
    var movieArray:[MovieModel]?// Movie is a structure containing details about the particular movie.

    override func viewDidLoad() {
        super.viewDidLoad()
        print("in viewLoad")

        
        movieArray = []
        activityIndicator.startAnimating()
        let objNetworking = Networking()
                
        objNetworking.response(url: Constant.server_base_url.rawValue) {(movieResult) in
            self.movieArray = movieResult.results
            
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }
        
        
        
        //declaring movie objects which will be pushed in Movie List.
        
        //MARK: Movie Data
//        let objMovie1 = Movie(title: "Title: Ad Astra", popularity: "Popularity Score: 176,614", releaseYear: "Release Year: 2020", image: #imageLiteral(resourceName: "adAstra"))
//        let objMovie2 = Movie(title: "Title: Zathura: A Space Adventure", popularity: "Popularity Score: 161,547", releaseYear: "Release Year: 2019", image: #imageLiteral(resourceName: "ZathuraPoster"))
//        let objMovie3 = Movie(title: "Title: Hamilton", popularity: "Popularity Score: 143,314", releaseYear: "Release Year: 2021", image: #imageLiteral(resourceName: "hamilton"))
//        let objMovie4 = Movie(title: "Title: Eurovision", popularity: "Popularity Score: 161,421", releaseYear: "Release Year: 2018", image: #imageLiteral(resourceName: "euro"))
        
        
        //Creating movie List which will be rendered in a Table View.
        
//        movieArray = [objMovie1, objMovie2, objMovie3, objMovie4,objMovie1, objMovie2, objMovie3, objMovie4,objMovie1, objMovie2, objMovie3, objMovie4,objMovie1, objMovie2, objMovie3, objMovie4,objMovie1, objMovie2, objMovie3, objMovie4,objMovie1, objMovie2, objMovie3, objMovie4,objMovie1, objMovie2, objMovie3, objMovie4,]
        
    
    // Function to declare table view Rows Count.
    
    //MARK: TableView Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray?.count ?? 0
    }
    
    // This function handles the data for the particular cell of table view.
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomCell
        
        
        // Alotting data for a cell
        
//        cell?.photoView?.image = movieArray[indexPath.row].image ??
        cell?.titleLabel.text = movieArray?[indexPath.row].title ?? ""
        cell?.popularityLabel.text = "Popularity: " + String((movieArray?[indexPath.row].popularity ?? 0))
        cell?.releaseLabel.text = ("Release Date: " + (movieArray?[indexPath.row].release_date  ?? ""))
        let urlImage = URL(string: Constant.image_base_url.rawValue + ((movieArray?[indexPath.row].backdrop_path) ?? ""))
           // print(urlImage)
            DispatchQueue.global().async {
              let data = try? Data(contentsOf: urlImage!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
              DispatchQueue.main.async {
                cell?.photoView.image = UIImage(data: data!)
              }
            }
        
        return cell!
    }
    
    // Function to set height of a cell in table view.
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        var objSelectedMovie = movieArray?[indexPath.row]
        
        let objSelectedMovieVC = self.storyboard?.instantiateViewController(identifier: "SelectedMovieVC") as? SelectedMovieVC
        
        if let objSelectedMovieVC = objSelectedMovieVC{
            
            print(movieArray?[indexPath.row].title ?? "")
            
            objSelectedMovieVC.titleRecieved = movieArray?[indexPath.row].title ?? ""
            objSelectedMovieVC.popularityRecieved = "Popularity: " + String((movieArray?[indexPath.row].popularity ?? 0))
            objSelectedMovieVC.releaseRecieved = ("Release Date: " + (movieArray?[indexPath.row].release_date  ?? ""))
            objSelectedMovieVC.imageURLRecieved = (movieArray?[indexPath.row].backdrop_path) ?? ""
//            objSelectedMovieVC.titleLabel.text = movieArray?[indexPath.row].title ?? ""
//            objSelectedMovieVC.popularityLabel.text = "Popularity: " + String((movieArray?[indexPath.row].popularity ?? 0))
//            objSelectedMovieVC.releaseLabel.text = ("Release Date: " + (movieArray?[indexPath.row].release_date  ?? ""))
//
        
            self.navigationController?.pushViewController(objSelectedMovieVC, animated: true)
        }
        
        
    }
}

