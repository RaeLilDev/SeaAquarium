//
//  HomeVC.swift
//  SeaAquarium
//
//  Created by Ye linn htet on 10/24/23.
//

import UIKit

enum HomeSection {
    case SLIDER_SECTION
    case CATEGORY_SECTION
    case EVENT_SECTION
    case UPCOMING_SECTION
}

class HomeVC: UIViewController {

    @IBOutlet weak var tableViewHome: UITableView!
    
    var itemList: [HomeSection] = [.SLIDER_SECTION, .CATEGORY_SECTION, .EVENT_SECTION, .UPCOMING_SECTION]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    private func setupTableView() {
        tableViewHome.dataSource = self
        tableViewHome.registerCell(from: HomeSliderCell.self)
        tableViewHome.registerCell(from: HomeCategoryCell.self)
        tableViewHome.registerCell(from: HomeEventCell.self)
        tableViewHome.registerCell(from: UpcomingShowCell.self)
    }
    
    private func getItem(by index: Int) -> HomeSection {
        return itemList[index]
    }
    
    private func presentDetail() {
        let vc = DetailVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = getItem(by: indexPath.row)
        switch item {
        case .SLIDER_SECTION:
            let cell = tableView.dequeueCell(from: HomeSliderCell.self, at: indexPath)
            cell.didTapItem = { [weak self] in
                guard let self = self else { return }
                self.presentDetail()
            }
            return cell
            
        case .CATEGORY_SECTION:
            let cell = tableView.dequeueCell(from: HomeCategoryCell.self, at: indexPath)
            return cell
            
        case .EVENT_SECTION:
            let cell = tableView.dequeueCell(from: HomeEventCell.self, at: indexPath)
            return cell
            
        case .UPCOMING_SECTION:
            let cell = tableView.dequeueCell(from: UpcomingShowCell.self, at: indexPath)
            cell.didTapItem = { [weak self] in
                guard let self = self else { return }
                self.presentDetail()
            }
            return cell
        }
    }
}
