//
//  SwiperController.swift
//  ytb_autoLayout
//
//  Created by pm on 2019/1/17.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit



class SwiperController: UICollectionViewController ,UICollectionViewDelegateFlowLayout {
    
    let reuseIdentifier = "Cell"
    let pages: [Page] = [
        Page(imageName: "instagram", headerText: "Instagram is a photo and video-sharing social networking service owned by Facebook", bodyText: "Create an account or log in to Instagram - A simple, fun & creative way to capture, edit & share photos, videos & messages with friends & family."),
        Page(imageName: "googlelogo", headerText: "Settings Your data in Search Help Send feedback. ", bodyText: "Google LLC is an American multinational technology company that specializes in Internet-related services and products, which include online advertising technologies, search engine, cloud computing, software, and hardware."),
        Page(imageName: "vuesax", headerText: "Vuesax Frontend Vue Components", bodyText: "Vuesax is a library of Vuejs components that facilitates front-end development and streamlines work with great visual quality."),
        Page(imageName: "rocket", headerText: "A rocket engine uses stored rocket propellant mass for forming its high-speed propulsive jet.", bodyText: "A rocket (from Italian rocchetto bobbin) is a missile, spacecraft, aircraft or other vehicle that obtains thrust from a rocket engine"),
    ]
    
  
    // 上一步按钮
    private let prevButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("prev", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return bt
    }()
    
    // 下一步按钮
    private let nextButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("next", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return bt
    }()
    
    // 分页控制器
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = UIColor.orange
        pc.pageIndicatorTintColor = UIColor.gray
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        setupPageControl()
    }
    
    @objc func handleNext() {
        guard pageControl.currentPage != pages.count - 1 else  { return }
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage = nextIndex
    }
    
    @objc func handlePrev() {
        guard pageControl.currentPage != 0 else  { return }
        let prevIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: prevIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage = prevIndex
    }
    
    fileprivate func setupPageControl() {
        let stackView = UIStackView(arrangedSubviews: [prevButton,pageControl,nextButton])
        view.addSubview(stackView)
        
        nextButton.setTitleColor(UIColor.orange, for: .normal)
        stackView.backgroundColor = UIColor.red
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.move().x
        let scollIndex = Int(x / view.frame.width)
        pageControl.currentPage = scollIndex
    }
}
