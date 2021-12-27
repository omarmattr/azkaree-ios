//
//  CustomPageViewController.swift
//  HashtagAlquds
//
//  Created by omarmattr on 09/07/2021.
//

import UIKit

class CustomPageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let proxy = UIPageControl.appearance()
            proxy.pageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            proxy.currentPageIndicatorTintColor =  UIColor(named: "Primary")
   
    }
    
    
}
