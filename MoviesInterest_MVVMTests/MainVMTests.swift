
import XCTest
@testable import MoviesInterest_MVVM
class MainVMTests: XCTestCase {

    struct mocks {
        static let nowPlaying = "Now Playing"
        static let size = 5
        static let data = MockData(size: mocks.size)
    }
    
    var vm: MainVM!
    
    override func setUp() {
        super.setUp()
        vm = MainVM(dataSource: mocks.data)
    }
    
    func testViewModelExposesTitle() {
        XCTAssertEqual(vm.title, mocks.nowPlaying)
    }

    func testViewModelExposesNumberOfMovies() {
        vm.fetchData()
        XCTAssertEqual(vm.numberOfMovies, mocks.size)
    }

    func testViewModelExposesModel() {
        vm.fetchData()
        XCTAssertEqual(vm.getModel(at: 0).title, "Title 0")
    }

}
