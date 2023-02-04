
import UIKit

class HomeScreenDataSource: NSObject {
    var vm:MainVM!
    init(vm:MainVM?) {
        self.vm = vm
    }
}

extension HomeScreenDataSource: SwipableViewDataSource {
    
    func numberOfItems(in swipableView: SwipableView?) -> Int {
        return vm.numberOfMovies
    }
    
    func swipableView(_ swipableView: SwipableView?, viewForItemAt index: Int, reusing view: UIView?) -> UIView? {
        if index < 0 || index >= vm.numberOfMovies {
            return nil
        }
        var temp: UIView?
        if (view != nil) {
            print("reusing view")
            temp = view
        } else {
            temp = Bundle.main.loadNibNamed("SwipableMovie", owner: self, options: nil)?[0] as? UIView
            temp?.frame = CGRect(x: 0, y: 0, width: swipableView!.frame.size.width, height: swipableView!.frame.size.height)
        }
        let v = temp as? SwipableMovie
        v?.item = vm.getCellViewModel(at: index)
        return temp
    }
}




