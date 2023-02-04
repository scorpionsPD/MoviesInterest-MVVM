
import XCTest
@testable import MoviesInterest_MVVM

class DetailsVMTests: XCTestCase {
    
        var vm: DetailsViewModel = DetailsViewModel(dataSource: MockData(size: 0))
        
        override func setUp() {
            super.setUp()
            vm.fetchMovie(id: 0, needRefresh: {
                print("fetched")
            })
        }
        
        func testViewModelTitle() {
            XCTAssertEqual(vm.title, MockData.mocks.title)
        }
        
        func testViewModelDescription() {
            XCTAssertEqual(vm.description, MockData.mocks.description)
        }
}
