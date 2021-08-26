//
//  Movie.swift
//  TheMovieDB
//
//  Created by UT on 25/08/21.
//

import UIKit

//struct Movie {
//
//   var title: String
//   var popularity: String
//   var  releaseYear: String
//    var image: UIImage
//}

struct MovieModel: Codable{
    
    var title: String?
    var popularity: Double?
    var  release_date: String?
    var backdrop_path: String?
}


struct MovieResult : Codable {
    var results:[MovieModel]?
}
