//
//  MovieViewController.swift
//  MovieApp
//
//  Created by Dzenan Djuderija on 10/8/20.
//

import UIKit

class ViewMovieListCell: UITableViewCell{
    @IBOutlet weak var mvDes: UILabel!
    @IBOutlet weak var mvDate: UILabel!
    @IBOutlet weak var mvName: UILabel!
    @IBOutlet weak var mvPoster: UIImageView!
}

class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   private let tableView: UITableView = {
        let table = UITableView()
        
        table.register(MovieCellTableViewCell.self, forCellReuseIdentifier: MovieCellTableViewCell.identifier)
        
        return table
    }()
    
    let poster: [UIImage] = [ UIImage(named: "PosterAndroid")!,]
    
    // hold movie name for search
    var mvName : [String] = []
    
    let movieList = [Movie]()

    @IBOutlet weak var table : UITableView!
    //@IBOutlet weak var movieName: UILabel!
    //@IBOutlet weak var movieDate: UILabel!
    //@IBOutlet weak var movieDescription: UILabel!
    //@IBOutlet weak var moviePoster: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //tableView.frame = view.bounds
    }

    @IBAction func didPressReturn(){
        let vc = storyboard?.instantiateViewController(identifier: "main_vc") as! TableViewController
        present(vc, animated: true)
    }
    
    func searchMovie(){
        //search for selected movie
    }
    
    //Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! ViewMovieListCell
        
        let mv = movieList[indexPath.row]
        //add data from json to each cell
        //cell.textLabel?.text = mv.original_title
        cell.mvDate.text = mv.release_date
        cell.mvName.text = mv.original_title
        cell.mvDes.text = mv.overview
        cell.mvPoster.image = poster[0]
        
        return cell
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
