//
//  HomeViewController.swift
//  azkaree
//
//  Created by omarmattr on 23/12/2021.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {


    private var cData = ""
    private let array = ItemHome.getData()
    @IBOutlet weak var tableView:UICollectionView!
    
    var player: AVAudioPlayer?

    @IBAction func btnS(_ sender:UIButton){
        playSound("s")

    }
    
    @IBAction func btnM(_ sender:UIButton){
        playSound("m")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ItemHomeCollectionViewCell.nib(), forCellWithReuseIdentifier: ItemHomeCollectionViewCell.identfier)


    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToAzkar" {
            let vc = segue.destination as! AzkarViewController
            vc.dataType = cData
            print(cData)
            
        }
    }


    func playSound(_ pmNmae:String) {
        let url = Bundle.main.url(forResource:pmNmae, withExtension: "mp3")

        do {
            player = try AVAudioPlayer(contentsOf: url!)
            guard let player = player else { return }

            player.prepareToPlay()
            player.play()

        } catch let error as NSError {
            print(error.description)
        }
    }
}
extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tableView.dequeueReusableCell(withReuseIdentifier: ItemHomeCollectionViewCell.identfier, for: indexPath) as! ItemHomeCollectionViewCell

        let item = array[indexPath.row]
        
        cell.mImage.image = item.image
        cell.name.text = item.name
        return cell
        
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cData = array[indexPath.row].name
        performSegue(withIdentifier: "GoToAzkar", sender: .none)

     
        
        
        
    }
      
    
}
