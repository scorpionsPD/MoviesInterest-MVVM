

import UIKit

class SwipableMovie: UIView {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var voteAverage: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    var item : SwipableMovieViewModel?{
        didSet{
            guard let item = item else {
                return
            }
            self.voteAverage.text = item.getVoterAvaerage()
            self.titleLbl.text = item.title
            item.getPosterImage { downloadedImage in
                DispatchQueue.main.async {
                    self.mainImageView.image = downloadedImage
                    self.backgroundColor = downloadedImage.averageColor
                }
            }
        }
    }
}
