//
//  FavoriteViewController.swift
//  azkaree
//
//  Created by omarmattr on 23/12/2021.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var colectionView:UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        colectionView.register(ItemFovaritCollectionViewCell.nib(), forCellWithReuseIdentifier: ItemFovaritCollectionViewCell.identfier)
    }
    


}
extension FavoriteViewController : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemFovaritCollectionViewCell.identfier, for: indexPath) as! ItemFovaritCollectionViewCell

        
        return cell
        
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 200)
    }
    
    
    
}
