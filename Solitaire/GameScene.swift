//
//  GameScene.swift
//  Solitaire
//
//  Created by JMD on 9/5/15.
//  Copyright (c) 2015 JMD. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var activeCard:Card?
    var touchedCards:[Card] = []
    
    
    override func didMoveToView(view: SKView) {
        print("GameScene.didMoveToView")
        
        physicsWorld.contactDelegate = self
        backgroundColor = UIColor(red: 50/255, green: 205/255, blue: 50/255, alpha: 1.0)
        
        let deck = Deck()
        deck.shuffle()
        var row:CGFloat = 0
        var column:CGFloat = 0

        for card in deck.cards{
            card.position = CGPoint(x: column*(card.size.width + 5) + 50, y: self.frame.height - row*(card.size.height+5) - 50 )
            addChild(card)
            column++
            if(column==6){
                column = 0
                row++
            }
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "touchesBegan:", name:"touchesBegan", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "touchesEnded:", name:"touchesEnded", object: nil)

    }
    
    func touchesBegan(sender: AnyObject) {
        activeCard = sender.object as? Card
        touchedCards.removeAll()
        //debugPrint("GS.touchesBegan", activeCard!.suit, activeCard!.rank)
    }
    
    func touchesEnded(sender: AnyObject) {
        //debugPrint("GS.touchesEnded", activeCard!.suit, activeCard!.rank)
        debugPrint("cards: ", touchedCards.count)
        for card in touchedCards {
            debugPrint(card.name)
        }
        activeCard = nil
    }
    
    func didBeginContact(contact:SKPhysicsContact){
        
        let card1 = contact.bodyA.node as! Card
        let card2 = contact.bodyB.node as! Card
        
        if activeCard != nil {
            
            if card1 == activeCard! {
                if touchedCards.indexOf(card2) == nil {
                    touchedCards.append(card2)
                }
            }
            else if card2 == activeCard! {
                if touchedCards.indexOf(card1) == nil {
                    touchedCards.append(card1)
                }
            }
        }
    }
    
    func didEndContact(contact:SKPhysicsContact){
        let card1 = contact.bodyA.node as! Card
        let card2 = contact.bodyB.node as! Card
        
        if activeCard != nil {
            if card1 == activeCard! {
                if (touchedCards.indexOf(card2) != nil) {
                    touchedCards.removeAtIndex(touchedCards.indexOf(card2)!)
                    debugPrint("removed ", card2.name)
                }
            }
            else if card2 == activeCard! {
                if (touchedCards.indexOf(card1) != nil) {
                    touchedCards.removeAtIndex(touchedCards.indexOf(card1)!)
                    debugPrint("removed ", card1.name)
                }
            }
        }
    }

    override func update(currentTime: CFTimeInterval) {
    }

}
