//
//  Disk.swift
//  AR Basketball
//
//  Created by Viktor on 31/03/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import ARKit

class Disk: SCNNode {
    
    init?(at sceneView: ARSCNView, fromY positionY: Float) {
        super.init()
        
        guard let torus = sceneView.scene.rootNode.childNode(withName: "torus", recursively: true) else { return nil }
        
        var outerRadius: CGFloat
        if positionY >= DiskLevel.lowerDisk {
            outerRadius = 0.4
        } else {
            outerRadius = 10.0
        }

        // get current frame
        geometry = SCNTube(innerRadius: 0.01, outerRadius: outerRadius, height: 0.01)
        
        let shape = SCNPhysicsShape(node: self, options: [
            SCNPhysicsShape.Option.collisionMargin: 0.01
            ])
        physicsBody = SCNPhysicsBody(type: .static, shape: shape)
        opacity = 0
        
        var position = torus.worldPosition
        position.y += positionY
        worldPosition = position
        
        switch positionY {
        case DiskLevel.upperDisk:
            name = "diskUpper"
        case DiskLevel.lowerDisk:
            name = "diskLower"
        case DiskLevel.floor:
            name = "floor"
        default:
            name = nil
        }
        
        physicsBody?.categoryBitMask = BitMaskCategory.disk
        physicsBody?.contactTestBitMask = BitMaskCategory.ball
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
