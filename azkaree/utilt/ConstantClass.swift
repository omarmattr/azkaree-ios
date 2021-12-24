//
//  ConstantClass.swift
//  Trix
//
//  Created by omarmattr on 19/12/2021.
//

import UIKit
class ConstantClass{
 
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
