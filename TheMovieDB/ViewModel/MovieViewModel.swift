//
//  MovieViewModel.swift
//  TheMovieDB
//
//  Created by UT on 31/08/21.
//

import Foundation

class MovieViewModel {
    
    
    var movieArray:[MovieModel]?
    
    func fetchMovieData(comp: @escaping  () -> ()){
        
        let objNetworking = Networking()
        objNetworking.response(url: Constant.server_base_url.rawValue) {(movieResult) in
                self.movieArray = movieResult.results
                comp()
        }
    }
    
    func getMoviesCount()->Int{
        
        return self.movieArray?.count ?? 0
    }
    
    func getMovie(for row: Int) -> MovieModel?{
        return movieArray?[row]
    }
    
    
}
