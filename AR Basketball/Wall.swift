//
//  Wall.swift
//  AR Basketball
//
//  Created by Viktor on 30/03/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import ARKit

class Wall: SCNNode {
    
    init(anchor: ARPlaneAnchor) {
        super.init()

        let extent = anchor.extent
        let width = CGFloat(extent.x)
        let height = CGFloat(extent.z)
        
        self.geometry = SCNPlane(width: width, height: height)
        self.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        self.eulerAngles.x = -.pi / 2
        self.name = "Wall"
        self.opacity = 0.25
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
