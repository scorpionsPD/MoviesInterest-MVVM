
import Foundation
@testable import MoviesInterest_MVVM

class SampleData {
    var nowPlaying: Data {
        let path = Bundle(for: SampleData.self).path(forResource: "now_playing", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        return data
    }
    
    var movie: Data {
        let path = Bundle(for: SampleData.self).path(forResource: "movie", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        return data
    }
}
