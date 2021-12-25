//
//  ItemHomeCollectionViewCell.swift
//  azkaree
//
//  Created by omarmattr on 23/12/2021.
//

import UIKit

class ItemHomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mImage:UIImageView!
    @IBOutlet weak var name:UILabel!
    static func nib() -> UINib {
          return UINib(nibName: "ItemHomeCollectionViewCell", bundle: .main)
      }
      static let identfier = "homeCell"
      
}
