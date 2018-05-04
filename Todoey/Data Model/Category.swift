//
//  Category.swift
//  Todoey
//
//  Created by jostein on 3/5/2018.
//  Copyright © 2018 jostein. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
    
}
