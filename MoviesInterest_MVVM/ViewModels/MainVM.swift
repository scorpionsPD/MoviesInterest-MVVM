
import Foundation

class MainVM {
    
    var needReloading: (()->())?

    private var dataSource: MovieDataSource
    private(set) var movies: [Movie] = [Movie]()

    init(dataSource: MovieDataSource) {
        self.dataSource = dataSource
    }
    
    private var swipableMovieViewModel: [SwipableMovieViewModel] = [SwipableMovieViewModel]() {
        didSet {
            self.needReloading?()
        }
    }
    
    var title: String {
        return "Now Playing"
    }
    
    var numberOfMovies: Int {
        return swipableMovieViewModel.count
    }
    
    func getCellViewModel(at index: Int) -> SwipableMovieViewModel {
        return swipableMovieViewModel[index]
    }
    
    func getModel(at index: Int) -> Movie {
        return movies[index]
    }
    
    func fetchData() {
        dataSource.fetchNowPlaying(completion: gotMovies(_:))
    }

    private func gotMovies(_ movies: [Movie]) {
        self.movies = movies
        
        swipableMovieViewModel = movies.map {
            SwipableMovieViewModel(movie: $0, dataSource: MoviesInterest())
        }
    }
    
}
