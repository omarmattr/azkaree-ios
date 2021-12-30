//
//  FavoriteViewController.swift
//  azkaree
//
//  Created by omarmattr on 23/12/2021.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var colectionView:UICollectionView!
    private let reader = JsonReader()

    var  finalArr : [String]!
    override func viewWillAppear(_ animated: Bool) {
        finalArr =  UserDefaults.standard.stringArray(forKey: ConstantClass.LOVE_ARR) ?? []

    }
    override func viewDidLoad() {
        super.viewDidLoad()

      
//        finalArr = arr.filter(){ z in
//            fArr.contains(z.zekr)
//        }

        colectionView.register(ItemFovaritCollectionViewCell.nib(), forCellWithReuseIdentifier: ItemFovaritCollectionViewCell.identfier)
    }
    


}
extension FavoriteViewController : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return finalArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemFovaritCollectionViewCell.identfier, for: indexPath) as! ItemFovaritCollectionViewCell
        cell.zekeer.text = finalArr[indexPath.row]
        cell.index = indexPath.row
        cell.onDelete = self
        return cell
        
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 200)
    }
    
    
    
}
extension FavoriteViewController : OnDelete{
    func OnDelete() {
        finalArr =  UserDefaults.standard.stringArray(forKey: ConstantClass.LOVE_ARR) ?? []
        colectionView.reloadData()

    }
    
    
}
