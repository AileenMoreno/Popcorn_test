//
//  MovieCollectionViewCell.swift
//  Popcorn
//
//  Created by Aileen Gabriela Moreno Perez on 2/13/19.
//

import UIKit
import Haneke

class MovieCollectionViewCell: UICollectionViewCell {

    // MARK: Outlets
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var votedImage: UIImageView!
    @IBOutlet weak var votedLabel: UILabel!
    
    // MARK: Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: Functions
    
    func loadPosterImagee(movie: Movie) {
        let apiURL = Constants.apiImagesURL
        let path = "\(apiURL)\(movie.posterPath)"
        if let url = URL(string: path) {
            posterImageView.hnk_setImage(from: url)
        }
        
        let width = posterImageView.bounds.width
        posterImageView.layer.cornerRadius = width/15
        posterImageView.layer.masksToBounds = true
    }
    
    func configureCell(movie: Movie) {
        self.titleLabel.text = movie.title
        self.votedLabel.text = "\(movie.voteCount)"
        loadPosterImagee(movie: movie)
    }
}
