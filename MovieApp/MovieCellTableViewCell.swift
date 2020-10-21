//
//  MovieCellTableViewCell.swift
//  MovieApp
//
//  Created by Dzenan Djuderija on 10/16/20.
//

import UIKit

//More cleaner code separeted class for cell

class MovieCellTableViewCell: UITableViewCell {
    
    static let identifier = "MovieCellTableViewCell"

    @IBOutlet weak var mvDes: UILabel!
    @IBOutlet weak var mvDate: UILabel!
    @IBOutlet weak var mvName: UILabel!
    @IBOutlet weak var mvPoster: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
