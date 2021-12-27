//
//  JsonReader.swift
//  azkaree
//
//  Created by omarmattr on 25/12/2021.
//

import Foundation
class JsonReader{
    func read(_ type:String) -> [Zekeer]{
        let typem =  type
        let path = Bundle.main.path(forResource: "data1", ofType: "json")!
        let fArr =  UserDefaults.standard.stringArray(forKey: ConstantClass.LOVE_ARR) ?? []
        let group = DispatchGroup()
        group.enter()
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! [[String:Any]]
            var arr = [Zekeer]()
            DispatchQueue.global(qos: .background).async {
                jsonResult.forEach { i in
                    let category = i["category"] as! String
                    if category == typem  {
                        guard
                            let count = i["count"] as? String ,
                            let description = i["description"] as? String,
                            let reference = i["reference"] as? String,
                            let zekr = i["zekr"] as? String
                        else{
                            return
                        }
                        let object = Zekeer(category: category, count: count, description: description, reference: reference, zekr: zekr,isLove: fArr.contains(zekr) )
                        arr.append(object)
                        
                    }
                }
                group.leave()
            }
            group.wait()
            return arr
            
        } catch {
            // handle error\
            return []
        }
    }
  
    
}
