//
//  ItemAzkarCollectionViewCell.swift
//  azkaree
//
//  Created by omarmattr on 23/12/2021.
//

import UIKit

class ItemAzkarCollectionViewCell: UICollectionViewCell {

    @IBAction func btnLove(_ senser:UIButton){
        senser.isSelected = !senser.isSelected
    }
    @IBAction func btnCopy(_ senser:UIButton){
        
    }
    static func nib() -> UINib {
          return UINib(nibName: "ItemAzkarCollectionViewCell", bundle: .main)
      }
      static let identfier = "azkarCell"
      

}
