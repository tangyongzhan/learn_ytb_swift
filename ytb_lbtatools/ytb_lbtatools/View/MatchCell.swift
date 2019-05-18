import UIKit
import LBTATools

class MatcheCell: LBTAListCell<Matche>{
    
    let imageView = CircularImageView(width: 80, image: nil)
    let nameLabel = UILabel(text: "name", font: .systemFont(ofSize: 14), textColor: .black, textAlignment: .left, numberOfLines: 1)
    
    override var item: Matche!{
        didSet{
            imageView.image = item.image
            nameLabel.text = item.name
            stack(imageView,
                  nameLabel,
                  spacing: 4, alignment: .center)
        }
    }
}
