//
//  AzkarViewController.swift
//  azkaree
//
//  Created by omarmattr on 23/12/2021.
//

import UIKit

class AzkarViewController: UIViewController {

    private var arr : [Zekeer]!
    var dataType:String!
    private let reader = JsonReader()

    @IBOutlet weak var colectionView:UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        arr = reader.read(dataType)
        colectionView.register(ItemAzkarCollectionViewCell.nib(), forCellWithReuseIdentifier: ItemAzkarCollectionViewCell.identfier)
    }
    
    

}
extension AzkarViewController : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemAzkarCollectionViewCell.identfier, for: indexPath) as! ItemAzkarCollectionViewCell
        let zekeer = arr[indexPath.row]
        cell.zekeer.text = zekeer.zekr
        cell.btnCounter.setTitle(zekeer.count, for: .normal)
            
        return cell
        
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}
