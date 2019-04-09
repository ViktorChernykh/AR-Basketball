//
//  BitMaskCategory.swift
//  AR Basketball
//
//  Created by Viktor on 28/03/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//
import ARKit

struct BitMaskCategory {

    static let ball = 1 << 0 // 00000000...1  1
    static let disk = 1 << 1 // 0000000...10  2
    static let hoop = 1 << 2 // 0000000..100  3
}

struct BitMaskDisk {
    
    static let upperDisk = 1 << 0 // 00000000...1  1
    static let lowerDisk = 1 << 1 // 0000000...10  2
    static let floor = 1 << 2 // 0000000..100  3
}

struct DiskLevel {
    static let upperDisk: Float = 0.0
    static let lowerDisk: Float = -0.4
    static let floor: Float = -4.0
}
