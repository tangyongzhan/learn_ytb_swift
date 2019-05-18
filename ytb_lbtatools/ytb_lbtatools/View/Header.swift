import UIKit
import LBTATools

class Header: UICollectionReusableView {
    var newMatchesLabel = UILabel(text: "New Matches", font: .systemFont(ofSize: 18), textColor: .red, textAlignment: .left, numberOfLines: 1)
    
    var messagesMatchesLabel = UILabel(text: "Messages", font: .systemFont(ofSize: 18), textColor: .red, textAlignment: .left, numberOfLines: 1)
    
    let matchesListController = MatchesListController(scrollDirection: .horizontal)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stack(hstack(newMatchesLabel).padLeft(16),
              matchesListController.view,
              hstack(messagesMatchesLabel).padLeft(16),
              spacing: 12).padTop(16)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

