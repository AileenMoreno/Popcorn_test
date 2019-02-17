//
//  MovieDetailViewController.swift
//  Popcorn
//
//  Created by Aileen Gabriela Moreno Perez on 2/16/19.
//

import UIKit
import Haneke

class MovieDetailViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    
    // MARK: Properties
    
    var movie: Movie!
    
    
    // MARK: Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLayoutData()
    }
    
    override func viewWillLayoutSubviews() {
        self.overviewLabel.sizeToFit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.overviewLabel.sizeToFit()
    }

    // MARK: Functions
    
    func loadPosterImage() {
        let apiURL = Constants.apiImagesURL
        let path = "\(apiURL)\(movie.posterPath)"
        if let url = URL(string: path) {
            posterImageView.hnk_setImage(from: url)
        }
        
        let width = posterImageView.bounds.width
        posterImageView.layer.cornerRadius = width/15
        posterImageView.layer.masksToBounds = true
    }
    
    func loadLayoutData() {
        titleLabel.text = movie.title
        releaseLabel.text = movie.releaseDate
        languageLabel.text = movie.originalLanguage
        likesLabel.text = "\(movie.voteCount)"
        overviewLabel.text = movie.overview
        overviewLabel.sizeToFit()
        self.loadPosterImage()
    }
}
