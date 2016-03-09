//
//  Kimara.swift
//  rpg_oop
//
//  Created by Mehdi on 07/03/2016.
//  Copyright © 2016 Mehdi. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    let IMMUNE_MAX = 15
    
    //Overriding the functions of Enemy
    override var loot: [String] {
        return ["Tough Hide", "Kimara Venom", "Rare Trident"]
    }

    override var type: String {
      return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPwr)
        } else {
            return false
        }
    }

}