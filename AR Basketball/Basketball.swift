//
//  Basketball.swift
//  AR Basketball
//
//  Created by Viktor on 30/03/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import ARKit

class Basketball: SCNNode {

    init?(at scene: ARSCNView) {
        super.init()
        
        // get current frame
        guard let frame = scene.session.currentFrame else { return nil }
        name = "ball"
        geometry = SCNSphere(radius: 0.25)
        geometry?.firstMaterial?.diffuse.contents = UIImage(named: "art.scnassets/diffuse.png")
        
        let shape = SCNPhysicsShape(node: self, options: [
            SCNPhysicsShape.Option.collisionMargin: 0.01
            ])
        let body = SCNPhysicsBody(type: .dynamic, shape: shape)
        physicsBody = body
        physicsBody?.categoryBitMask = BitMaskCategory.ball
        physicsBody?.collisionBitMask = BitMaskCategory.ball | BitMaskCategory.hoop
        physicsBody?.contactTestBitMask = BitMaskCategory.disk
        
        // get the location of the camera ( simd_float4x4 ) and assign this value to the ball
        let transform = frame.camera.transform
        simdTransform = transform
        
        let power = Float(10)   // сила 10H
        let cameraTransform = SCNMatrix4(transform)
        
        var force = SCNVector3()
        // The 3rd column is the direction vector
        force.x = -cameraTransform.m31 * power
        force.y = -cameraTransform.m32 * power
        force.z = -cameraTransform.m33 * power
        
        physicsBody?.applyForce(force, asImpulse: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
