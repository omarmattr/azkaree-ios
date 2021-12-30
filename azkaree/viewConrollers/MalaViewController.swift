//
//  MalaViewController.swift
//  azkaree
//
//  Created by omarmattr on 24/12/2021.
//

import UIKit


class MalaViewController: UIViewController {

    private var aim = 33
    @IBOutlet weak var counter:UIButton!
    @IBAction func btnReset(_ sender:UIButton){
        
        counter.setTitle("0", for: .normal)
    }
    @IBAction func btnNewAim(_ sender:UIButton){
        let alert = UIAlertController(title: title, message: "اضافة هدف جديد", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "تم", style: .default, handler: { action in
            self.aim = Int( alert.textFields!.first!.text!) ?? 33
            UserDefaults.standard.set(self.aim, forKey: ConstantClass.AIM)
        }))
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "الهدف"
            textField.text = String(self.aim)
            textField.keyboardType = .numberPad
        })
        
        self.present(alert, animated: true)
    }
    @IBAction func counter(_ sender:UIButton){
        let newValue = (Int(sender.title(for: .normal)!) ?? 0 )+1
        if  newValue <= aim {
            sender.setTitle(String(newValue), for: .normal)
        }
       
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set((Int(counter.title(for: .normal)!) ?? 0 ), forKey: ConstantClass.AIM)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        aim =  UserDefaults.standard.integer(forKey:ConstantClass.AIM)
        counter.setTitle(String( UserDefaults.standard.integer(forKey:ConstantClass.COUNT)), for: .normal)
        // Do any additional setup after loading the view.
    }
    



}
