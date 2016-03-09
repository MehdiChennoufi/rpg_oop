//
//  ViewController.swift
//  rpg_oop
//
//  Created by Mehdi on 07/03/2016.
//  Copyright © 2016 Mehdi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // == VARIABLES et CONSTANTES ==
    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var player1HPLbl: UILabel!
    @IBOutlet weak var enemyHPLbl: UILabel!
    @IBOutlet weak var enemyImage: UIImageView!
    @IBOutlet weak var chestBtn: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMsg: String?
    
    
    // At the application start
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player(name: "DirtyLaundry21", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()
        
        player1HPLbl.text = "\(player.hp) HP"
        
    }

    // === ACTIONS FUNCTIONS ===
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHP: 50, attackPwr: 12)
        } else {
            enemy = DevilWizard(startingHP: 60, attackPwr: 15)
        }
        enemyImage.hidden = false
    }
    
    
    @IBAction func onChestTapped(sender: AnyObject) {
        chestBtn.hidden = true
        printLbl.text = chestMsg
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }

    @IBAction func onAttackTapped(sender: AnyObject) {
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHPLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMsg = "\(player.name) found \(loot)"
            chestBtn.hidden = false
            
        }
        
        if !enemy.isAlive {
            enemyHPLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
            enemyImage.hidden = true
        }
    }

    
}

