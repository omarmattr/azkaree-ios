//
//  TabBarNav.swift
//  azkaree
//
//  Created by omarmattr on 24/12/2021.
//

import UIKit

class MyTabBarController: UITabBarController ,UITabBarControllerDelegate {

    override func viewDidLoad() {
        self.delegate = self

    }
    // UITabBarDelegate
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch  item.tag {
        case 0: self.navigationItem.title = "Home"
        case 1: self.navigationItem.title = "Fovarit"
        case 2: self.navigationItem.title = "Mala"
        case 3: self.navigationItem.title = "Setting"
        default:
            self.navigationController?.title = "Home"
        }
    }

//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        print(viewController.self)
//    }


}
