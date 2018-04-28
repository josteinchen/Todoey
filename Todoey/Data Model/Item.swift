//
//  Item.swift
//  Todoey
//
//  Created by jostein on 27/4/2018.
//  Copyright © 2018 jostein. All rights reserved.
//

import Foundation

class Item: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.done, forKey: "done")
        
        aCoder.encode(self.title, forKey: "title")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        
       self.title = aDecoder.decodeObject(forKey: "title") as? String
        self.done = aDecoder.decodeBool(forKey: "done")
    }
    
    override init() {
        
        
    }
    
    var title : String! = ""
    var done = false
}
