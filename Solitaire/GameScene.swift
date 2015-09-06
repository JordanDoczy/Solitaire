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
            let image = SKSpriteNode()
            image.texture = card.texture
            image.position = CGPoint(x: row*cardWidth + 100, y: column*cardHeight + 100 )
            image.size.width = cardWidth
            image.size.height = cardHeight
            addChild(image)
            row++
            if(row==13){
                row = 0
                column++
            }
        }
        
        
        
        
        
        
        
        //let imageName = "Deck"
        //let image = UIImage(named: imageName)
        //let imageView = UIImageView(image: image!)
        //imageView.frame = CGRect(x: 10, y: 50, width: 948/3, height: 615/3)
        //view.addSubview(imageView)
        
    }
    
}
