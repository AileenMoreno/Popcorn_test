//
//  MoviesCollectionViewController.swift
//  Popcorn
//
//  Created by Aileen Gabriela Moreno Perez on 2/5/19.
//

import UIKit
import SVProgressHUD

class MoviesCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    private let sectionInsets = UIEdgeInsets(top: 50.0,
                                             left: 20.0,
                                             bottom: 50.0,
                                             right: 20.0)
    
    private let moviesManager = MovieManager()
    private var currentMenu: Menu? = nil {
        didSet {
            self.menuDidUpdate()
        }
    }
    
    // MARK: Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchPopularMovieList()
        self.registerCells()
        self.configureTitle()
        self.configureBarButtons()
    }
    
    // MARK: Functions
    
    func configureTitle() {
        if let navigationController = self.navigationController {
            let color = Constants.Color.redMainColor
            navigationController.navigationBar.topItem?.title = "POPCORN"
            navigationController.navigationBar.tintColor = .black
            navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
        }
    }
    
    func configureBarButtons() {
        let popularSelector = #selector(self.fetchPopularMovieList)
        let popularImage = UIImage(named: "starIcon")
        let popularButtonItem = UIBarButtonItem(image: popularImage,
                                                style: .done,
                                                target: self,
                                                action: popularSelector)
        
        let ratedSelector = #selector(self.fetchTopRatedMovieList)
        let ratedImage = UIImage(named: "ratedIcon.png")
        let ratedButtonItem = UIBarButtonItem(image: ratedImage,
                                                style: .plain,
                                                target: self,
                                                action: ratedSelector)
        
        let barButtons = [ratedButtonItem, popularButtonItem]
        navigationItem.rightBarButtonItems = barButtons
    }
    
    func registerCells() {
        let identifier = Constants.CellIdentifiers.movieCollection
        let nib = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        self.collectionView.register(nib,
                                     forCellWithReuseIdentifier: identifier)
    }
    
    @objc func fetchPopularMovieList() {
        SVProgressHUD.show()
        moviesManager.fetchPopularMovies() { (menu) in
            SVProgressHUD.dismiss()
            if let menu = menu {
                self.currentMenu = menu
            }
        }
    }
    
    @objc func fetchTopRatedMovieList() {
        SVProgressHUD.show()
        moviesManager.fetchTopRatedMovies() { (menu) in
            SVProgressHUD.dismiss()
            if let menu = menu {
                self.currentMenu = menu
            }
        }
    }
    
    func menuDidUpdate() {
        let indexPath = IndexPath(row: 0, section: 0)
        self.collectionView.reloadData()
        self.collectionView.scrollToItem(at: indexPath,
                                         at: .top,
                                         animated: true)
    }
    
    func getMovie(for indexPath: IndexPath) -> Movie? {
        if let menu = self.currentMenu {
            let movies = menu.movies
            let row = indexPath.row
            
            if row < movies.count {
                return movies[row]
            }
        }
        return nil
    }

    // MARK: - UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        if let menu = self.currentMenu {
            let movies = menu.movies
            return movies.count
        }
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = Constants.CellIdentifiers.movieCollection
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MovieCollectionViewCell
        
        if let movie = getMovie(for: indexPath) {
            
            // Configure the cell
            cell.configureCell(movie: movie)
        }
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        if let movie = getMovie(for: indexPath),
            let navigationController = self.navigationController {
            let movieDetailController = MovieDetailViewController()
            movieDetailController.movie = movie
            navigationController.pushViewController(movieDetailController,
                                                    animated: true)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MoviesCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItemsPerLine: CGFloat = 2
        let paddingSpace = sectionInsets.left * (numberOfItemsPerLine + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / numberOfItemsPerLine
        
        return CGSize(width: widthPerItem, height: widthPerItem * 2.3)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
