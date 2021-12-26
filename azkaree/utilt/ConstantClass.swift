//
//  ConstantClass.swift
//  Trix
//
//  Created by omarmattr on 19/12/2021.
//

import UIKit
class ConstantClass{
    
   static let FIRST_OPEN_KEY = "isFirst"
    static let SCREEN_WIDTH =  UIScreen.main.bounds.size.width

   static func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: targetSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(targetSize, true, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
   
     static func moveToVC(storyboard:UIStoryboard?,viewC:String){
         if let vc = storyboard?.instantiateViewController(withIdentifier: viewC){
             
             if #available(iOS 13.0, *) {
                 if let sceneWindow = UIApplication.shared.connectedScenes.first{
                     (sceneWindow.delegate as? SceneDelegate)?.window?.rootViewController = vc
                 }
             }else{
                ( UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = vc
             }
             
         }
     }
 
    static func loadUrl(_ imageView : UIImageView , url:String){
         do {
             guard   let url =  URL(string: url)else {
                 return
             }
             let data = try Data(contentsOf: url)
         
            imageView.image = UIImage(data: data)
         }
         catch{
             print(error)
         }
     }

    static func hideNav(_ viewC:UIViewController,_ isHidden : Bool = true){
        viewC.navigationController?.isNavigationBarHidden = isHidden
    }
    static func showAlertDanger(vc:UIViewController, title:String,message:String,handler: ((UIAlertAction) -> Void)? = nil,dis: ((UIAlertController) -> Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "نعم", style: .destructive, handler: handler))
        dis(alert)
        alert.addAction(UIAlertAction(title: "الغاء", style: .cancel))
        vc.present(alert, animated: true)
      
    }

}
