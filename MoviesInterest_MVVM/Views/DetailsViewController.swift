
import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var releaseYearLbl: UILabel!
    @IBOutlet weak var titlelLbl: UILabel!
    
    private var detailsViewModel = DetailsViewModel(dataSource: MoviesInterest())
    
    private var movieId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let id = self.movieId {
            detailsViewModel.fetchMovie(id: id, needRefresh: { [weak self] in
                self?.bindViewModal()
            })
        }
    }
    private func bindViewModal() {
        DispatchQueue.main.async { [weak self] in
            self?.navigationItem.title = self?.detailsViewModel.title
            self?.titlelLbl.text = self?.detailsViewModel.title
            self?.descriptionLbl.text = self?.detailsViewModel.description
            self?.releaseYearLbl.text = self?.detailsViewModel.release
            self?.detailsViewModel.getPosterImage({ image in
                DispatchQueue.main.async {
                    self?.posterImage.image = image
                    self?.view.backgroundColor = image.averageColor
                }
            })
        }
    }
    
    func setMovieID(_ id: Int) {
        self.movieId = id
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
