

import Foundation
import UIKit

class ImageDownloader {
    
    let imageCache = NSCache<AnyObject, AnyObject>()
    
    func downloadImage(from url: URL, completion: @escaping (UIImage?) ->()) {
        
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            completion(imageFromCache)
        }
        else{
            getData(from: url) { [self] data, response, error in
                guard let data = data, error == nil else { return }
                if let image = UIImage(data: data){
                    imageCache.setObject(image, forKey: url as AnyObject)
                    completion(image)
                }
            }
        }
    }
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    private func posterUrl(from posterPath: String?, for size: Constants.PosterSize) -> URL {
        let urlAsString = "\(size.address)\(posterPath ?? "")?api_key=\(MoviesInterest().apiKey)"
        guard let url = URL(string: urlAsString) else {
            fatalError("Could not create url for poster download")
        }
        return url
    }
}
