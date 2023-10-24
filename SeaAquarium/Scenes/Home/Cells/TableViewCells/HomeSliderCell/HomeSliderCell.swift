//
//  HomeSliderCell.swift
//  SeaAquarium
//
//  Created by Ye linn htet on 10/24/23.
//

import UIKit

class HomeSliderCell: UITableViewCell {

    @IBOutlet weak var collectionViewSlider: UICollectionView!
    @IBOutlet weak var pageControl: CustomPageControl!
    
    var didTapItem: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
        
        setupPageControl()
        
    }

    private func setupCollectionView() {
        collectionViewSlider.dataSource = self
        collectionViewSlider.delegate = self
        collectionViewSlider.registerCell(from: SliderItemCell.self)
    }
    
    private func setupPageControl() {
        pageControl.dotCount = 3
        pageControl.currentPage = 0
    }
    
}

extension HomeSliderCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(from: SliderItemCell.self, at: indexPath)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollPos = scrollView.contentOffset.x / scrollView.frame.width
        pageControl.currentPage = Int(scrollPos)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.didTapItem?()
    }
}

extension HomeSliderCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}
