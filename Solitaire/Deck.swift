//
//  Deck.swift
//  Solitaire
//
//  Created by JMD on 9/5/15.
//  Copyright © 2015 JMD. All rights reserved.
//

import Foundation
import SpriteKit

class Deck {
        
    var cards: [Card] = []
    let texture:SKTexture = SKTexture(imageNamed: "deck.png")
    
    init(){
        
        createDeck()
    }
    
    func createDeck(){
        cards.removeAll()
        
        for i:UInt32 in 1...4 {
            for j:UInt32 in 1...13 {
                cards.append(createCard(Suit(rawValue: i)!, rank: Rank(rawValue: j)!))
            }
        }
    }
    
    func createCard(suit:Suit, rank:Rank) -> Card{
        let texture = getCardTexture(suit, rank: rank)
        let card = Card(suit: suit, rank: rank, texture: texture)
        return card;
    }
    
    func print(){
        for card in cards{
            card.print();
        }
    }
    
    func shuffle() {
        var temp: [Card] = [];
        while cards.count > 0 {
            let j = Int(arc4random_uniform(UInt32(cards.count)))
            temp.append(cards.removeAtIndex(j))
        }
        cards = temp;
    }
    
    func getCardTexture(suit:Suit, rank:Rank)->SKTexture{
        let x:CGFloat = CGFloat(rank.rawValue-1)/13
        let y:CGFloat = CGFloat(suit.rawValue-1)/4
        let width:CGFloat = 1/13
        let height:CGFloat = 1/4
        let bounds:CGRect = CGRectMake(x, y, width, height)
        return SKTexture(rect: bounds, inTexture: texture)
    }
}
