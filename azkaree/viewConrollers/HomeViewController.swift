//
//  HomeViewController.swift
//  azkaree
//
//  Created by omarmattr on 23/12/2021.
//

import UIKit
import AVFoundation
import MediaPlayer

class HomeViewController: UIViewController {


    private var cData = ""
    private let array = ItemHome.getData()
    @IBOutlet weak var tableView:UICollectionView!
    
    var player: AVPlayer?

    @IBAction func btnS(_ sender:UIButton){
        playSound("s")

    }
    
    @IBAction func btnM(_ sender:UIButton){
        playSound("m")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  ConstantClass.set()
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
        
        let path = Bundle.main.url(forResource:pmNmae, withExtension: "mp3")

         do{
             try player = AVPlayer(url: path!)
            setupAVAudioSession()
         } catch {
             print("File is not Loaded")
         }
//         let session = AVAudioSession.sharedInstance()
//         do{
//            try session.setCategory(AVAudioSession.Category.playback)
//
//         }
//         catch{
//         }
       
       // player!.play()
//        let url = Bundle.main.url(forResource:pmNmae, withExtension: "mp3")
//        do {
//            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay])
//            print("Playback OK")
//            try AVAudioSession.sharedInstance().setActive(true)
//            print("Session is Active")
//            player = try AVAudioPlayer(contentsOf: url!)
//
//        } catch {
//            print(error)
//        }
//        guard let player = player else { return }
//
//        player.prepareToPlay()
//        player.play()
//    }
    }
    private func setupAVAudioSession() {
        let session = AVAudioSession.sharedInstance()

        do {
            try session.setCategory(AVAudioSession.Category.playback)
          //  try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            //try AVAudioSession.sharedInstance().setActive(true)
            debugPrint("AVAudioSession is Active and Category Playback is set")
            UIApplication.shared.beginReceivingRemoteControlEvents()
            setupCommandCenter()
        } catch {
            debugPrint("Error: \(error)")
        }
    }
    private func setupCommandCenter() {
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [MPMediaItemPropertyTitle: "azkaree"]
        self.player?.play()
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.isEnabled = true
        commandCenter.pauseCommand.isEnabled = true
        
        commandCenter.playCommand.addTarget { [weak self] (event) -> MPRemoteCommandHandlerStatus in
            self?.player?.play()
            return .success
        }
        commandCenter.nextTrackCommand.addTarget { [unowned self] (event)  in
            let path = Bundle.main.url(forResource:"m", withExtension: "mp3")
            player = AVPlayer(url: path!)
            player?.play()
            return .success
        }
        commandCenter.previousTrackCommand.addTarget { [unowned self] (event)  in
            let path = Bundle.main.url(forResource:"s", withExtension: "mp3")
            player = AVPlayer(url: path!)
            player?.play()
            return .success
        }
        commandCenter.pauseCommand.addTarget { [weak self] (event) -> MPRemoteCommandHandlerStatus in
            self?.player?.pause()
            return .success
        }
        commandCenter.changePlaybackPositionCommand.addTarget { event in
            print("Asdfasdfasdfas \(event)")
            let event = event as! MPChangePlaybackPositionCommandEvent
         
            self.player?.seek(to: CMTimeMakeWithSeconds(         event.positionTime,       preferredTimescale: 1000000
))
            return MPRemoteCommandHandlerStatus.success
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
