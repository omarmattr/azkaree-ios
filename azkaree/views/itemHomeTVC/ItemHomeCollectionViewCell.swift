//
//  ItemHomeCollectionViewCell.swift
//  azkaree
//
//  Created by omarmattr on 23/12/2021.
//

import UIKit

class ItemHomeCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static func nib() -> UINib {
          return UINib(nibName: "ItemHomeCollectionViewCell", bundle: .main)
      }
      static let identfier = "homeCell"
      
}
