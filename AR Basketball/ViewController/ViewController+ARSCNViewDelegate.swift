//
//  ViewController+ARSCNViewDelegate.swift
//  AR Basketball
//
//  Created by Viktor on 28/03/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import ARKit

extension ViewController: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        if !hoopAdded {
            guard let anchor = anchor as? ARPlaneAnchor else { return }
            let wall = Wall(anchor: anchor)
            node.addChildNode(wall)
        }
    }
}
