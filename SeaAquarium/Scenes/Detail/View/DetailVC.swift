//
//  DetailVC.swift
//  SeaAquarium
//
//  Created by Ye linn htet on 10/24/23.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var collectionViewSlider: UICollectionView!
    @IBOutlet weak var sliderContainer: UIView!
    @IBOutlet weak var pageControl: CustomPageControl!
    
    @IBOutlet weak var viewDistance: UIStackView!
    @IBOutlet weak var ivClose: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupCollectionView()
        setupGestureRecognizers()
    }
    
    private func setupView() {
        sliderContainer.layer.cornerRadius = 20.0
        sliderContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        viewDistance.layer.borderWidth = 0.5
        viewDistance.layer.borderColor = UIColor.darkGray.cgColor
        viewDistance.layer.cornerRadius = 6.0
    }
    
    private func setupCollectionView() {
        collectionViewSlider.dataSource = self
        collectionViewSlider.delegate = self
        collectionViewSlider.registerCell(from: DetailSliderItemCell.self)
    }
    
    private func setupGestureRecognizers() {
        let tapClose = UITapGestureRecognizer(target: self, action: #selector(onTapClose))
        ivClose.isUserInteractionEnabled = true
        ivClose.addGestureRecognizer(tapClose)
    }
    
    @objc private func onTapClose() {
        self.navigationController?.popViewController(animated: true)
    }

}

extension DetailVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(from: DetailSliderItemCell.self, at: indexPath)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollPos = scrollView.contentOffset.x / scrollView.frame.width
        pageControl.currentPage = Int(scrollPos)
    }
}

extension DetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}
