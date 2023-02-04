
import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let posterPath: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
           case id
           case posterPath = "poster_path"
           case title
           case voteAverage = "vote_average"
       }
}


