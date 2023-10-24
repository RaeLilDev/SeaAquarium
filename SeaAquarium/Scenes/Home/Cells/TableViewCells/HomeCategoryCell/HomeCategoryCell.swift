//
//  HomeCategoryCell.swift
//  SeaAquarium
//
//  Created by Ye linn htet on 10/24/23.
//

import UIKit

class HomeCategoryCell: UITableViewCell {

    @IBOutlet weak var collectionViewCategory: UICollectionView!
    
    private let categoryList: [CategoryVO] = [
                    CategoryVO(name: "Map", icon: UIImage(named: "ic_map")),
                    CategoryVO(name: "Inhabitants", icon: UIImage(named: "ic_inhabitants")),
                    CategoryVO(name: "Shows", icon: UIImage(named: "ic_shows")),
                    CategoryVO(name: "Shopping", icon: UIImage(named: "ic_shopping")),
                    CategoryVO(name: "Dine", icon: UIImage(named: "ic_dine")),
                    CategoryVO(name: "Meet & Greets", icon: UIImage(named: "ic_meet_and_greets"))
    ]
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupCollectionView() {
        collectionViewCategory.dataSource = self
        collectionViewCategory.delegate = self
        collectionViewCategory.registerCell(from: CategoryItemCell.self)
        let customLayout = LeftToRightTopToBottomLayout()
        collectionViewCategory.collectionViewLayout = customLayout
    }
    
}

extension HomeCategoryCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(from: CategoryItemCell.self, at: indexPath)
        cell.data = categoryList[indexPath.row]
        return cell
    }
}

extension HomeCategoryCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 40) / 4
        return CGSize(width: width, height: 120.0)
    }
}
