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

class Card {
    
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
    
    
}
