//
//  AppDelegate.swift
//  Todoey
//
//  Created by jostein on 27/4/2018.
//  Copyright © 2018 jostein. All rights reserved.
//

import UIKit

import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
       // print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        do {
             _ = try Realm()
        } catch {
            print("Error initialising new realm, \(error)")
        }
       
        
        return true
    }
 
    
    
}

