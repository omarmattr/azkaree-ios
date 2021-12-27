//
//  ItemFovaritCollectionViewCell.swift
//  azkaree
//
//  Created by omarmattr on 23/12/2021.
//

import UIKit

class ItemFovaritCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var zekeer:UILabel!
    var index = 0
    var onDelete : OnDelete!
    
    @IBAction func btnCancel(_ senser:UIButton){
        var  arr =  UserDefaults.standard.stringArray(forKey:ConstantClass.LOVE_ARR) ?? []
        arr.remove(at: index)
        UserDefaults.standard.set(arr, forKey: ConstantClass.LOVE_ARR)
        onDelete.OnDelete()
    }
    @IBAction func btnCopy(_ senser:UIButton){
        UIPasteboard.general.string = zekeer.text!

    }
    static func nib() -> UINib {
          return UINib(nibName: "ItemFovaritCollectionViewCell", bundle: .main)
      }
      static let identfier = "fovaritCell"
      

}
protocol OnDelete {
    func OnDelete()
}
