//
//  AppDelegate.swift
//  azkaree
//
//  Created by omarmattr on 23/12/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if UserDefaults.standard.bool(forKey: ConstantClass.FIRST_OPEN_KEY){
         self.window?.rootViewController?.performSegue(withIdentifier: "goToHome", sender: .none)
        }
        self.window?.overrideUserInterfaceStyle = UserDefaults.standard.bool(forKey:  ConstantClass.IS_DARK) ? .dark : .light
      
        let navigationView =   UINavigationBar.appearance()
        let name = UserDefaults.standard.bool(forKey:  ConstantClass.IS_DARK) ? "navbar-n" : "navbar"
        navigationView.shadowImage = ConstantClass.resizeImage( image:UIImage(named:name)!,targetSize: CGSize(width: ConstantClass.SCREEN_WIDTH, height: 10))
        return true
    }

    // MARK: UISceneSession Lifecycle;'p

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
extension UIView {

    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow(shadowRadius: layer.cornerRadius)
            }
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        //    self.layer.maskedCorners = [.layerMinXMaxYCorner ,  .layerMaxXMaxYCorner]
            
            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
          
        }
    }
    @IBInspectable var cornerCircle: Bool {
        get {
            return layer.cornerRadius > 0.0
        }
        set {
            let radius = layer.bounds.size.width/2
            self.layer.cornerRadius = radius
        //    self.layer.maskedCorners = [.layerMinXMaxYCorner ,  .layerMaxXMaxYCorner]
            
            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
          
        }
    }
    @IBInspectable var cornerBRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.maskedCorners = [.layerMinXMaxYCorner ,  .layerMaxXMaxYCorner]
            self.layer.cornerRadius = newValue
         
        }
    }
    @IBInspectable var cornerBRRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.maskedCorners = [ .layerMaxXMaxYCorner]
            self.layer.cornerRadius = newValue
         
        }
    }
    @IBInspectable var cornerBLadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.maskedCorners = [.layerMinXMaxYCorner ]
            self.layer.cornerRadius = newValue
         
        }
    }

 
    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                   shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
                   shadowOpacity: Float = 0.1,
                   shadowRadius: CGFloat = 3.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    
}
extension Double {
    func splitAtDecimal() -> [Int] {
        
        let stringNum: String = "\(self)"
       return  stringNum.components(separatedBy: ".").map({
            return Int($0)!
        })
    }
}

