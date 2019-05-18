import UIKit
import LBTATools

class MatchesListController: LBTAListController<MatcheCell,Matche>, UICollectionViewDelegateFlowLayout{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        items = [
            .init(image: UIImage(named: "girl"), name: "Girl geeney 1"),
            .init(image: UIImage(named: "girl"), name: "Girl geeney 2"),
            .init(image: UIImage(named: "girl"), name: "Girl geeney 3"),
            .init(image: UIImage(named: "girl"), name: "Girl geeney 4"),
            .init(image: UIImage(named: "girl"), name: "Girl geeney 5"),
            .init(image: UIImage(named: "girl"), name: "Girl geeney 6"),
            .init(image: UIImage(named: "girl"), name: "Girl geeney 7"),
        ]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: view.frame.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 8, bottom: 0, right: 8)
    }
    
}
