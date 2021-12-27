//
//  MalaViewController.swift
//  azkaree
//
//  Created by omarmattr on 24/12/2021.
//

import UIKit


class MalaViewController: UIViewController {

    @IBOutlet weak var counter:UIButton!
    @IBAction func btnReset(_ sender:UIButton){
        
        counter.setTitle("0", for: .normal)
    }
    @IBAction func btnNewAim(_ sender:UIButton){
        
    }
    @IBAction func counter(_ sender:UIButton){
        let newValue = (Int(sender.title(for: .normal)!) ?? 0 )+1
        sender.setTitle(String(newValue), for: .normal)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    



}
