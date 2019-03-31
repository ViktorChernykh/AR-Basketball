//
//  Disk.swift
//  AR Basketball
//
//  Created by Viktor on 31/03/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import ARKit

class Disk: SCNNode {
    
    init?(at sceneView: ARSCNView, fromY level: Float) {
        super.init()
        
        guard let torus = sceneView.scene.rootNode.childNode(withName: "torus", recursively: true) else { return nil }

        // get current frame
        self.geometry = SCNTube(innerRadius: 0.01, outerRadius: 0.3, height: 0.01)
        
        let shape = SCNPhysicsShape(node: self, options: [
            SCNPhysicsShape.Option.collisionMargin: 0.01
            ])
        self.physicsBody = SCNPhysicsBody(type: .static, shape: shape)
        self.opacity = 0
        var position = torus.worldPosition
        position.y += level
        self.worldPosition = position
        if level == 0 {
            self.name = "diskUpper"
        } else {
            self.name = "diskLower"
        }
        
        self.physicsBody?.categoryBitMask = BitMaskCategory.disk
        self.physicsBody?.contactTestBitMask = BitMaskCategory.ball
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
