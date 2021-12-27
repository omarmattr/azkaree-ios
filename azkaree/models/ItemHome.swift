//
//  ItemHome.swift
//  azkaree
//
//  Created by omarmattr on 25/12/2021.
//
import UIKit
struct ItemHome {
    let image:UIImage
    let name:String
    static func getData()->Array<ItemHome>{
        var array :Array<ItemHome> = []
        array.append(ItemHome(image: UIImage(named: "sunrise")!, name: "أذكار الصباح"))
        array.append(ItemHome(image: UIImage(named: "cloudy-night")!, name: "أذكار المساء"))
        
        array.append(ItemHome(image: UIImage(named: "bedtime")!, name: "أذكار النوم"))
        
        array.append(ItemHome(image: UIImage(named: "wake-up")!, name: "أذكار الاستيقاظ من النوم"))
        
        return array
    }
}
