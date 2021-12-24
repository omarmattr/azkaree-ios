//
//  AzkarViewController.swift
//  azkaree
//
//  Created by omarmattr on 23/12/2021.
//

import UIKit

class AzkarViewController: UIViewController {

    @IBOutlet weak var colectionView:UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        colectionView.register(ItemAzkarCollectionViewCell.nib(), forCellWithReuseIdentifier: ItemAzkarCollectionViewCell.identfier)
    }
    
    

}
extension AzkarViewController : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemAzkarCollectionViewCell.identfier, for: indexPath) as! ItemAzkarCollectionViewCell

        
        return cell
        
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 200)
    }
    
    
    
}
