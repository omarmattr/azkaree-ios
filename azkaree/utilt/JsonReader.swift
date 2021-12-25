//
//  JsonReader.swift
//  azkaree
//
//  Created by omarmattr on 25/12/2021.
//

import Foundation
class JsonReader{
    func read(_ fileName:String)-> [Zekeer] {
        let path = Bundle.main.path(forResource: fileName, ofType: "json")!
            do {
               let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! [[String:Any]]
                var arr = [Zekeer]()
                
                jsonResult.forEach { i in
                    guard let category = i["category"] as? String ,
                          let count = i["count"] as? String ,
                          let description = i["description"] as? String,
                          let reference = i["reference"] as? String,
                          let zekr = i["zekr"] as? String
                    else{
                        return
                    }
                    let object = Zekeer(category: category, count: count, description: description, reference: reference, zekr: zekr)
                
                    arr.append(object)
                }
                return arr
                
            } catch {
                // handle error\
                return []
            }
        }
    
    
}
