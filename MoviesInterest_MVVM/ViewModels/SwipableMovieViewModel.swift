
import Foundation
import UIKit

struct SwipableMovieViewModel {
    
    private var dataSource: MovieDataSource
    
    let title: String
    private let poster: String
    private let voteAverage: Double
    
    func getPosterImage(_ complition: @escaping (UIImage)->()) {
        self.dataSource.fetchImage(from: poster, for: .small) { image in
            complition(image)
        }
    }
    
    func getVoterAvaerage() -> String {
        return "\(voteAverage)" + " / 10"
    }
    
    init(movie: Movie, dataSource: MovieDataSource) {
        self.title = movie.title
        self.poster = movie.posterPath
        self.voteAverage = movie.voteAverage
        self.dataSource = dataSource
    }
}
