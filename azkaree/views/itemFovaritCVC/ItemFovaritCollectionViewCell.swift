//
//  ItemFovaritCollectionViewCell.swift
//  azkaree
//
//  Created by omarmattr on 23/12/2021.
//

import UIKit

class ItemFovaritCollectionViewCell: UICollectionViewCell {

    @IBAction func btnCancel(_ senser:UIButton){
    }
    @IBAction func btnCopy(_ senser:UIButton){
        
    }
    static func nib() -> UINib {
          return UINib(nibName: "ItemFovaritCollectionViewCell", bundle: .main)
      }
      static let identfier = "fovaritCell"
      

}
