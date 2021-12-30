//
//  MyAppBar.swift
//  azkaree
//
//  Created by omarmattr on 26/12/2021.
//

import UIKit

class MyAppBar: UINavigationController {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToHome"{
                let aaa = segue.destination as! UITabBarController
                aaa.navigationItem.hidesBackButton = true
                
            }
        }

}
