
import Foundation
@testable import MoviesInterest_MVVM
import UIKit

struct MockData: MovieDataSource {

    struct mocks {
        static let title = "Some title"
        static let description = "Some description"
        static let posterPath = "image.jpg"
        static let releaseDate = "2022-12-01"
    }

    let size: Int
    
    func fetchNowPlaying(completion: @escaping ([Movie])->()) {
        let movies = Array(0..<size).map {
            Movie(id: $0, title: "Title \($0)", posterPath: "", voteAverage: Double($0))
        }
        
        completion(movies)
    }
    
    func fetchImage(from posterPath: String?, for size: Constants.PosterSize, completion: @escaping (UIImage) -> ()) {
        
    }
    
    func fetchMovie(id: Int, completion: @escaping (MovieDetails)->()) {
        let movie = MovieDetails(id: 0, title: mocks.title, overview: mocks.description, posterPath: mocks.posterPath, releaseDate: mocks.releaseDate)
        completion(movie)
    }

}
