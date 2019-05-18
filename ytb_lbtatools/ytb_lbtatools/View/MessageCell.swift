import UIKit
import LBTATools

class MessageCell: LBTAListCell<Message> {
    
    let imageView = CircularImageView(width: 80, image: nil)
    let nameLabel = UILabel(text: "name", font: .boldSystemFont(ofSize: 16), textColor: .black, textAlignment: .left, numberOfLines: 1)
    let messageLabel = UILabel(text: "message", font: .systemFont(ofSize: 14), textColor: .darkGray, textAlignment: .left, numberOfLines: 2)
    override var item: Message!{
        didSet {
            imageView.image = item.image
            nameLabel.text = item.name
            messageLabel.text = item.message
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        hstack(
            imageView,
            stack(nameLabel,messageLabel, spacing: 8, alignment: .leading),
            spacing: 8, alignment: .center).withMargins(.allSides(16))
        
        addSeparatorView(leadingAnchor: nameLabel.leadingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
