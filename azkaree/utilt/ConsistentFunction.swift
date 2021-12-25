//
//  File.swift
//  HashtagAlquds
//
//  Created by omarmattr on 10/07/2021.
//

import UIKit
open class ConsistentFunction{
   static func checkInput(_ txtField :UITextField)-> String? {
        let text = txtField.text!
        if text.isEmpty {
            return nil
        }
        return text
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
    static func pushViewControl(storyboard:UIStoryboard?,navigationController:UINavigationController?,named:String){
        if let vc = storyboard?.instantiateViewController(withIdentifier: named) {
            navigationController?.pushViewController(vc, animated: true)

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

     static let LOGIN_KEY = "isLogin"
    static let COLLECTION_POST = "posts"
    static let COLLECTION_COMMENT = "comments"

    static let COLLECTION_USER = "users"
    static let COLLECTION_VILLAGE = "villages"
}
