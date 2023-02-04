
import XCTest
@testable import MoviesInterest_MVVM

class SwipableMovieVMTesta: XCTestCase {

    func testViewModelExposesTitle() {
        let title = "Some title"
        let poster = "Some poster path"
        let voteAvg = 0
        let data = MockData(size: 3)
        let vm = SwipableMovieViewModel(movie: Movie(id: 0, title: title, posterPath: poster, voteAverage: Double(voteAvg)), dataSource: data)
        XCTAssertEqual(vm.title, title)
    }
}
