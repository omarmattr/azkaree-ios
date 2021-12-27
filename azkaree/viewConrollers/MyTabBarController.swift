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
        self.navigationItem.title = "الصفحة الرئيسة"


    }
    // UITabBarDelegate
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch  item.tag {
        case 0: self.navigationItem.title = "الصفحة الرئيسة"
        case 1: self.navigationItem.title = "المفضلة"
        case 2: self.navigationItem.title = "السبحة"
        case 3: self.navigationItem.title = "الاعدادات"
        default:
            self.navigationController?.title = "Home"
        }
    }

//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        print(viewController.self)
//    }


}
