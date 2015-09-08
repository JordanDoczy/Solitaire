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

class Card:SKSpriteNode {
    
    let _size:CGSize = CGSize(width: 40,height: 40*1.4)
    var suit:Suit
    var rank:Rank
    
    init(suit:Suit, rank:Rank, texture:SKTexture){
        self.suit = suit
        self.rank = rank
        
        super.init(texture: texture, color: UIColor.whiteColor(), size: _size)
        userInteractionEnabled = true
    }

   required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func print()->Void{
        debugPrint(suit, rank, texture!.textureRect())
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint("touchesBegan")
        //let touch:UITouch = touches.first! as UITouch
        //let position = touches.first!.locationInView(touch.view?.superview)
        //self.position = position
        print()
        
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //debugPrint("touchesMoved")
        let touch:UITouch = touches.first! as UITouch
        position = touch.locationInView(touch.view)
        //let position = touches.first!.locationInView(touch.view?.superview)
        //let previousPosition = touches.first!.previousLocationInView(touch.view?.superview)
        //let newPosition = CGPoint(x: previousPosition.x-position.x, y: previousPosition.y-position.y)

        //self.position = previousPosition
    }
    
    

    
}

/*

import Foundation
import UIKit
import SpriteKit

class Card {

let width:CGFloat = 40
let height:CGFloat = 40*1.4


var suit:Suit
var rank:Rank
var texture:SKTexture

init(suit:Suit, rank:Rank, texture:SKTexture){
self.suit = suit
self.rank = rank
self.texture = texture
}

func print()->Void{
debugPrint(suit, rank, texture.textureRect())
}

func getSpriteNode()->SKSpriteNode{
let image = SKSpriteNode()
image.texture = texture
image.size.width = width
image.size.height = height
return image
}



}

*/
