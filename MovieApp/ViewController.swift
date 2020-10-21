//
//  ViewController.swift
//  MovieApp
//
//  Created by Dzenan Djuderija on 10/8/20.
//

import UIKit

//let mvarray = ["Batman", "Rocky", "Pirates", "Fast", "Chan", "Back", "Lord"]

//custom Cell for custom data
/*class ViewCell: UITableViewCell{
    @IBOutlet weak var movieNames: UILabel!
}*/


class TableViewController: UITableViewController {
    //for storing moviesSearched
    let defaults = UserDefaults.standard
    let savedSearch = [String]()
    //test for poster load and view
    //var for storing searched movie list
    var moviesSearched = ["Batman", "Rocky", "Pirates", "Fast", "Chan", "Back", "Lord"]
    //var moviesSearched = [String]()
    
    var selectedMovie:[String]!
    //returned data from json aka list of movies returned bz our search
    var movieList = [Movie](){
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "\(self.movieList.count) Movies Found"
            }
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar! 


    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        defaults.set(moviesSearched, forKey: "saved")
        moviesSearched = defaults.array(forKey: "saved") as! [String]
        //defaults.set(moviesSearched, forKey: "saved")
        // Do any additional setup after loading the view.
    }

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }*/
    //MARK- when we select item form searched movies to go and search for it again
   /* override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let text = tableView. else{return}
        let movieRequest = MovieRequest(movieName: text)
    }*/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesSearched.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) //as! ViewCell
        
        cell.textLabel?.text = moviesSearched[indexPath.row]
        
        return cell
    }
    
}
 //triggering API call on search
extension TableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        /*let alert = UIAlertController(title: "Bad Search", message: "No movie found with this name.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))*/
        guard let searchBarText = searchBar.text else {return}
        let movieRequest = MovieRequest(movieName: searchBarText)
        movieRequest.getMovies { [weak self] result in
            switch result {
            case .failure(let error):
                //self?.present(alert, animated: true, completion: nil)
                print(error)
            case .success(let movies):
                print(movieRequest)
                self?.movieList = movies//on succes add response to movies array
                self?.moviesSearched.append(searchBarText)//add searched movie to list
                let vc = self?.storyboard?.instantiateViewController(identifier: "main_vc") as! MovieViewController
                self?.present(vc, animated: true)//present second view controller for movie searched view
            }
        }
    }
}




