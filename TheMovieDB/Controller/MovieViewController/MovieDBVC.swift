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
    
    //MARK: - DataSource For TableVIew
    
    let vm = MovieViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("in viewLoad")
        activityIndicator.startAnimating()
        vm.fetchMovieData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
            
    }
        
    
    //MARK: - TableView Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.getMoviesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomCell
        cell?.movieData = vm.getMovie(for: indexPath.row)
        cell?.setProperties()
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    //MARK: - SelectedCell
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objSelectedMovieVC = self.storyboard?.instantiateViewController(identifier: "SelectedMovieVC") as? SelectedMovieVC
        if let objSelectedMovieVC = objSelectedMovieVC{
            objSelectedMovieVC.movieData = vm.getMovie(for: indexPath.row)
            self.navigationController?.pushViewController(objSelectedMovieVC, animated: true)
        }
    }
}



