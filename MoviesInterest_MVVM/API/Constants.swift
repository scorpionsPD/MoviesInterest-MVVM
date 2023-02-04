
import Foundation
import UIKit

let MAX_WIDTH = UIScreen.main.bounds.size.width
let MAX_HEIGHT = UIScreen.main.bounds.size.height

enum Constants {
    enum Backend {
        static let url = "https://api.themoviedb.org/3"
    }

    enum PosterSize {
        case small
        case original

        var address: String {
            let host = "https://image.tmdb.org/t/p"

            switch self {
            case .small:
                return "\(host)/w342"
            case .original:
                return "\(host)/original"
            }
        }
    }
}
