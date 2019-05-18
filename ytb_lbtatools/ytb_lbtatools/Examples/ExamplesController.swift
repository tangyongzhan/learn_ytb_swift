

import LBTATools

class ExampleCell: LBTAListCell<String> {
    
    let titleLabel = UILabel(text: "Title", font: .systemFont(ofSize: 16))
    
    override var item: String! {
        didSet {
            titleLabel.text = item
        }
    }
    
    override func setupViews() {
        super.setupViews()
        stack(titleLabel).padLeft(24)
        addSeparatorView(leadingAnchor: titleLabel.leadingAnchor)
    }
}

class ExamplesController: LBTAListController<ExampleCell, String>, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Examples"
        items = [
            "Sample ListHeaderController",
            "Stack and hstack",
            "Login Form Keyboard Management"
        ]
        collectionView.alwaysBounceVertical = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 0:
            navigationController?.pushViewController(SimpleListController(), animated: true)
        case 1:
            navigationController?.pushViewController(StackingExampleController(), animated: true)
        default:
            present(LoginFormController(alignment: .top), animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
