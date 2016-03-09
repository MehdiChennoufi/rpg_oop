//
//  Character.swift
//  rpg_oop
//
//  Created by Mehdi on 07/03/2016.
//  Copyright © 2016 Mehdi. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    
    //Getters / Setters
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    //Is the player alive ?
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    //Constructor
    init(startingHP: Int, attackPwr: Int) {
        self._hp = startingHP
        self._attackPwr = attackPwr
    }
    
    func attemptAttack(attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        
        return true
    }
}