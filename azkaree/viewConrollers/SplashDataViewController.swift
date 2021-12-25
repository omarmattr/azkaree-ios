//
//  SplashDataViewController.swift
//  HashtagAlquds
//
//  Created by omarmattr on 09/07/2021.
//

import UIKit

class SplashDataViewController: UIViewController {
    @IBOutlet var sInage:UIImageView!
    @IBOutlet var sDetail:UILabel!
    var data:SplashItem?
    var index:Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        sInage.image = data?.photo
        sDetail.text = data?.text
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
