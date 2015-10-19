//
//  Card.swift
//  Solitaire
//
//  Created by JMD on 9/5/15.
//  Copyright © 2015 JMD. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

var _zPosition:CGFloat = 1

class Card:SKSpriteNode {
    
    let _size:CGSize = CGSize(width: 50,height: 50*1.4)
    var suit:Suit
    var rank:Rank
    var cardColor:CardColor
    var previousPosition = CGPoint()
    
    init(suit:Suit, rank:Rank, texture:SKTexture){
        self.suit = suit
        self.rank = rank
        self.cardColor = suit == Suit.Hearts || suit == Suit.Diamonds ? CardColor.Red : CardColor.Black
        
        
        super.init(texture: texture, color: UIColor.whiteColor(), size: _size)
        
        name = String(self.rank) + " of " + String(self.suit)
        userInteractionEnabled = true
        physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 35,height: 49)
, center: position)
        physicsBody!.affectedByGravity = false
        physicsBody!.categoryBitMask = Object.Card.rawValue
        physicsBody!.contactTestBitMask = Object.Card.rawValue
        physicsBody!.collisionBitMask = Object.Card.rawValue
        physicsBody!.usesPreciseCollisionDetection = true
        physicsBody!.allowsRotation = false


    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func print()->Void{
        debugPrint(suit, rank)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NSNotificationCenter.defaultCenter().postNotificationName("touchesBegan", object:self)
        previousPosition = position
        //physicsBody!.velocity = CGVectorMake(5, 80)
//        physicsBody!.density = 5
//        physicsBody!.mass = 0.05
//        physicsBody!.applyTorque(3.5)
        physicsBody!.applyForce(CGVectorMake(20,20))
        //physicsBody!.applyImpulse(CGVectorMake(2, 4))
        physicsBody!.velocity = CGVectorMake(40, 40)

    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        var p = touch.locationInView(touch.view)
        p.y = self.scene!.size.height - p.y
        position = p
        _zPosition++
        zPosition = _zPosition
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NSNotificationCenter.defaultCenter().postNotificationName("touchesEnded", object:self)
    }
}
