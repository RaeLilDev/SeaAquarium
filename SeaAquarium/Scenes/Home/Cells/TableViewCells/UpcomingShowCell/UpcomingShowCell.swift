//
//  UpcomingShowCell.swift
//  SeaAquarium
//
//  Created by Ye linn htet on 10/24/23.
//

import UIKit

class UpcomingShowCell: UITableViewCell {

    @IBOutlet weak var collectionViewUpcoming: UICollectionView!
    
    var didTapItem: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionViewUpcoming.dataSource = self
        collectionViewUpcoming.delegate = self
        collectionViewUpcoming.registerCell(from: UpcomingShowItemCell.self)
    }
    
}

extension UpcomingShowCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(from: UpcomingShowItemCell.self, at: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.didTapItem?()
    }
    
    
}

extension UpcomingShowCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width * 0.75
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
}
