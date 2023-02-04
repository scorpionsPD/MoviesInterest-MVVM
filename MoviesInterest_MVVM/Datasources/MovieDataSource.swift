

import Foundation
import UIKit

protocol MovieDataSource {
    func fetchNowPlaying(completion: @escaping ([Movie])->())
    func fetchMovie(id: Int, completion: @escaping (MovieDetails)->())
    func fetchImage(from posterPath: String?, for size: Constants.PosterSize,completion: @escaping (UIImage)->())
}
