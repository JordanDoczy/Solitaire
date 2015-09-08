//
//  GameScene.swift
//  Solitaire
//
//  Created by JMD on 9/5/15.
//  Copyright (c) 2015 JMD. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        debugPrint("GameScene.didMoveToView")
        backgroundColor = SKColor.whiteColor()
        
        let deck = Deck()
        let cardWidth:CGFloat = 40
        let cardHeight:CGFloat = cardWidth*1.4

        var row:CGFloat = 0
        var column:CGFloat = 0

        for card in deck.cards{
            card.position = CGPoint(x: row*cardWidth + 100, y: column*cardHeight + 100 )
            addChild(card)
            row++
            if(row==13){
                row = 0
                column++
            }
        }
        
        NSUserDefaults.standardUserDefaults().

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint("touchesBegan")
        for touch in touches{
            debugPrint(touch.view)
        }
        
    }
    
}
