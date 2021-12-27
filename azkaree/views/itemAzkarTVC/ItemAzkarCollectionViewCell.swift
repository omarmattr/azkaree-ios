//
//  ItemAzkarCollectionViewCell.swift
//  azkaree
//
//  Created by omarmattr on 23/12/2021.
//

import UIKit

class ItemAzkarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var zekeer:UILabel!
    @IBOutlet weak var btnCounter:UIButton!
    @IBOutlet weak var btnLove:UIButton!

    var count = 0
    @IBAction func btnLove(_ senser:UIButton){
        senser.isSelected = !senser.isSelected
        var  arr =  UserDefaults.standard.stringArray(forKey:ConstantClass.LOVE_ARR) ?? []
        arr.append(zekeer.text!)
        UserDefaults.standard.set(arr, forKey: ConstantClass.LOVE_ARR)

    }
    @IBAction func btnCopy(_ senser:UIButton){
        UIPasteboard.general.string = zekeer.text!
    }
   
    
    static func nib() -> UINib {
          return UINib(nibName: "ItemAzkarCollectionViewCell", bundle: .main)
      }
      static let identfier = "azkarCell"
      

}
