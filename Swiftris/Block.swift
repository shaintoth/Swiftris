//
//  Block.swift
//  Swiftris
//
//  Created by Shain Toth on 1/29/20.
//  Copyright © 2020 Shain Toth. All rights reserved.
//

import SpriteKit

let NumberOfColors: UInt32 = 6

enum BlockColor: Int, CustomStringConvertible {
    
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    var spriteName: String {
           switch self {
           case .Blue:
               return "blue"
           case .Orange:
             return "orange"
           case .Purple:
             return "purple"
           case .Red:
               return "red"
           case .Teal:
             return "teal"
           case .Yellow:
               return "yellow"
           }
    }
    
    var description: String {
        return self.spriteName
    }
    
    static func random() -> BlockColor {
        return BlockColor(rawValue: Int(arc4random_uniform(NumberOfColors)))!
    }
}

class Block: Hashable, CustomStringConvertible {
    let color: BlockColor
    
    var column: Int
    var row: Int
    var sprite: SKSpriteNode?
    
    var spriteName: String {
        return color.spriteName
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.column)
        hasher.combine(self.row)
        hasher.combine(self.color)
    }
    
    var description: String {
        return "\(color): [\(column), \(row)]"
    }
    
    init(column:Int, row:Int, color:BlockColor){
        self.column = column
        self.row = row
        self.color = color
    }
}


func ==(lhs: Block, rhs: Block) -> Bool{
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.rawValue == rhs.color.rawValue
}

