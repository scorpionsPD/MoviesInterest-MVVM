
import UIKit

class MainViewController: UIViewController {
    
    var viewModel: MainVM = MainVM(dataSource: MoviesInterest())
    var swipeView:SwipableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = viewModel.title
        
        swipeView = SwipableView(frame: self.view.frame)
        self.view.addSubview(self.swipeView!)
        
        bindViewModel()
        viewModel.fetchData()
        // Do any additional setup after loading the view.
    }
    func bindViewModel() {
        viewModel.needReloading = { [weak self] in
            DispatchQueue.main.sync {
                let dataSource = HomeScreenDataSource(vm: self?.viewModel)
                self?.swipeView!.dataSource = dataSource
                self?.swipeView!.delegate = self
            }
        }
    }
}

extension MainViewController: SwipableViewDelegate{
    func swipableViewCurrentItemIndexDidChange(_ swipableView: SwipableView?) {}
    func swipableView(_ swipableView: SwipableView?, didSelectItemAt index: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            vc.setMovieID(viewModel.getModel(at: index).id)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func swipeDownFinished(_ swipableView: SwipableView?) {}
    func swipeUPFinished(_ swipableView: SwipableView?) {}
}
