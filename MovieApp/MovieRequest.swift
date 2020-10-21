//
//  MovieRequest.swift
//  MovieApp
//
//  Created by Dzenan Djuderija on 10/9/20.
//

import Foundation

enum MovieError:Error{
    case noDataAvailable
    case canNotProcessData
}

struct MovieRequest {
    let resourceURL:URL
    let API_KEY = "2696829a81b1b5827d515ff121700838"
    //var mvName:String
    
    init(movieName:String) {
        //let resourceString = "https://api.themoviedb.org/3/search/movie?api_key=\(API_KEY)&query=\(movieName)"
        let resourceString = "https://api.themoviedb.org/3/search/movie?api_key=2696829a81b1b5827d515ff121700838&query=\(movieName)"
        guard let resourceURL = URL(string: resourceString) else{fatalError()}
        
        self.resourceURL = resourceURL
    }

    func getMovies (completion: @escaping(Result<[Movie], MovieError>) -> Void){
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let movieResponse = try decoder.decode(MoviesInfo.self, from: jsonData)
                let movieDetails = movieResponse.results
                completion(.success(movieDetails))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
    
}
