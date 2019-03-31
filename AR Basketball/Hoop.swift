//
//  Hoop.swift
//  AR Basketball
//
//  Created by Viktor on 30/03/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import ARKit

class Hoop: SCNNode {

    private override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func createHoop(result: ARHitTestResult) -> SCNNode? {
        
        guard let scene = SCNScene(named: "art.scnassets/Hoop.scn") else { return nil }
        guard let node = scene.rootNode.childNode(withName: "Hoop", recursively: false) else {
            return nil
        }
        if let backboard = node.childNode(withName: "box", recursively: false) {
            backboard.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "art.scnassets/backboard.png")
        }
        let shape = SCNPhysicsShape(node: node, options: [
            SCNPhysicsShape.Option.type: SCNPhysicsShape.ShapeType.concavePolyhedron
            ])
        node.physicsBody = SCNPhysicsBody(type: .static, shape: shape)
        
        node.simdTransform = result.worldTransform
        node.eulerAngles.x -= .pi / 2
        
        node.physicsBody?.categoryBitMask = BitMaskCategory.hoop
        node.physicsBody?.collisionBitMask = BitMaskCategory.ball

        return node
    }
    
    class func removeWall(at scene: ARSCNView) {
        scene.scene.rootNode.enumerateChildNodes { node, _ in
            if node.name == "Wall" {
                node.removeFromParentNode()
            }
        }
    }
    


}
