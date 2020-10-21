//
//  Movie.swift
//  MovieApp
//
//  Created by Dzenan Djuderija on 10/9/20.
//

import Foundation

//struct MovieResponse:Decodable {
  //  var response:Movies
//}

//struct Movies:Decodable {
  //  var movies:MoviesInfo
//}

//outer respons from json
struct MoviesInfo:Decodable {
    public var page:String
    public var total_results:String
    public var total_pages:String
    public var results:[Movie]
}

//inner respons form json
struct Movie:Decodable{
    public var title:String
    public var release_date:String
    public var original_title:String
    public var overview:String
    //public var poster_path:String
}
