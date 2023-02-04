
import Foundation
import UIKit

struct MoviesInterest: MovieDataSource {
    static let baseUrl = "https://api.themoviedb.org/3/%@?api_key=%@"
    static let apiKeySettingKey = "api_key"
    
    private(set) var apiKey: String = ApiKeyStore.theMovieDbKey
    
    func fetchNowPlaying(completion: @escaping ([Movie])->()) {
        makeRequest(path: "movie/now_playing") { (data) in
            completion(TheMovieDBDecoder.parseNowPlaying(data))
        }
    }
    
    func fetchMovie(id: Int, completion: @escaping (MovieDetails)->()) {
        makeRequest(path: "movie/\(id)") { (data) in
            completion(TheMovieDBDecoder.parseMovie(data))
        }
    }
    
    func fetchImage(from posterPath: String?, for size: Constants.PosterSize,completion: @escaping (UIImage)->()) {
        
        let urlAsString = "\(size.address)\(posterPath ?? "")?api_key=\(apiKey)"
        guard let url = URL(string: urlAsString) else {
            fatalError("Could not create url for poster download")
        }
        ImageDownloader().downloadImage(from: url, completion: { image in
            if let image = image {
                completion(image)
            }
        })
    }
    
    
    private func makeRequest(path: String, completion: @escaping (Data)->()) {

        guard let url = URL(string: String(format: MoviesInterest.baseUrl, path, apiKey)) else {
            print("Invalid URL.")
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) -> Void in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
                print("Invalid response or empty data")
                return
            }
            
            completion(data)
        }
        
        dataTask.resume()
    }
}
