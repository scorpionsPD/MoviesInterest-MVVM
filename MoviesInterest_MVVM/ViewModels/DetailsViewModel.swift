
import Foundation
import UIKit

class DetailsViewModel {

    private var dataSource: MovieDataSource
    private var movie: MovieDetails?
    
    init(dataSource: MovieDataSource) {
        self.dataSource = dataSource
    }
    
    var title: String {
        return movie?.title ?? ""
    }
    
    var description: String {
        return movie?.overview ?? ""
    }
    
    var poster: String {
        return movie?.posterPath ?? ""
    }
    
    var release: String {
        let date = movie?.releaseDate.dateFromString
        return date?.stringFromDate ?? ""
    }
    
    
    func getPosterImage(_ complition: @escaping (UIImage)->()) {
        self.dataSource.fetchImage(from: movie?.posterPath, for: .small) { image in
            complition(image)
        }
    }
    
    func fetchMovie(id: Int, needRefresh: (()->())?) {
        dataSource.fetchMovie(id: id, completion: { [weak self] (movie) in
            self?.movie = movie
            needRefresh?()
        })
    }

}
