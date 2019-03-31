//
//  BitMaskCategory.swift
//  AR Basketball
//
//  Created by Viktor on 28/03/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

struct BitMaskCategory {
    
    static let none = 0 << 0 // 00000000...0  0
    static let ball = 1 << 0 // 00000000...1  1
    static let disk = 1 << 1 // 0000000...10  2
    static let hoop = 1 << 2 // 0000000..100  3
}
