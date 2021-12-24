//
//  HomeViewController.swift
//  azkaree
//
//  Created by omarmattr on 23/12/2021.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        ConstantClass.hideNav(self)
    }
    override func viewWillDisappear(_ animated: Bool) {
        ConstantClass.hideNav(self,false)

    }
    @IBOutlet weak var tableView:UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ItemHomeCollectionViewCell.nib(), forCellWithReuseIdentifier: ItemHomeCollectionViewCell.identfier)


    }
    



}
extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tableView.dequeueReusableCell(withReuseIdentifier: ItemHomeCollectionViewCell.identfier, for: indexPath) as! ItemHomeCollectionViewCell

        
        return cell
        
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GoToAzkar", sender: .none)
        
    }
      
    
}
