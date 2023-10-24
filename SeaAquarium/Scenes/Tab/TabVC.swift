//
//  TabVC.swift
//  SeaAquarium
//
//  Created by Ye linn htet on 10/24/23.
//

import UIKit

class TabVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpColors()
        setUpViewControllers()
    }
    
    private func setUpColors() {
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        tabBar.tintColor = UIColor(named: "colorPrimary")
        tabBar.unselectedItemTintColor = UIColor.darkGray
        tabBar.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    //MARK: - Setup ViewControllers
    
    //Add viewModel References
    private func setUpViewControllers() {
        viewControllers?.removeAll()
    
        let home = HomeVC()
        home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "ic_home"), tag: 0)
        
        let wallet = WalletVC()
        wallet.tabBarItem = UITabBarItem(title: "Wallet", image: UIImage(named: "ic_wallet"), tag: 1)
        
        let more = MoreVC()
        more.tabBarItem = UITabBarItem(title: "More", image: UIImage(named: "ic_more"), tag: 2)
        viewControllers = [home, wallet, more]
    }
    
    
}


extension TabVC: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let controllers = self.navigationController?.viewControllers ?? []
        return controllers.count > 1
    }
}

