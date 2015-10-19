//
//  Enums.swift
//  Solitaire
//
//  Created by JMD on 9/5/15.
//  Copyright © 2015 JMD. All rights reserved.
//

import Foundation


enum Suit:UInt32{
    case Clubs=1, Diamonds, Spades, Hearts
}

enum Rank:UInt32{
    case Ace=1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
}

enum CardColor:UInt32{
    case Red, Black
}

enum Object: UInt32 {
    case Board
    case Card
    case Pile
}
