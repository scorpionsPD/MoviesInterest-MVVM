

import Foundation

struct TheMovieDBDecoder {

    static func parseNowPlaying(_ data: Data) -> [Movie] {
        let decoder = JSONDecoder()
        let results = try! decoder.decode(NowPlaying.self, from: data)
        return results.results
    }

    static func parseMovie(_ data: Data) -> MovieDetails {
        let decoder = JSONDecoder()
        let movie = try! decoder.decode(MovieDetails.self, from: data)
        return movie
    }
}
