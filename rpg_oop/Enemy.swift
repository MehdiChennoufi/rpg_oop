//
//  Enemy.swift
//  rpg_oop
//
//  Created by Mehdi on 07/03/2016.
//  Copyright © 2016 Mehdi. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot: [String] {
        return["Rusty Dagger", "Cracked Buckler"]
    }

    var type: String {
        return "Grunt"
    }
    
    
    func dropLoot() -> String? {
        
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
            //the arc4random => to get a random number of the value in the "loot" array
            //with some casting
        }
        
        return nil
    }
}
