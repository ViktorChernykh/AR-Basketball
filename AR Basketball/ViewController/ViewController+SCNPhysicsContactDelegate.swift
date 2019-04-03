//
//  ViewController+SCNPhysicsContactDelegate.swift
//  AR Basketball
//
//  Created by Viktor on 29/03/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import ARKit

extension ViewController: SCNPhysicsContactDelegate {
    
    func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
        
        guard let nameA = contact.nodeA.name else { return }
        guard let nameB = contact.nodeB.name else { return }
        
        guard (nameA == "ball") || (nameB == "ball") else { return }
        
        guard (nameA == "diskUpper") || (nameB == "diskUpper") || (nameA == "diskLower") || (nameB == "diskLower") else { return }

        var nodeBall = SCNNode()
        var nodeDisk = SCNNode()
        
        if nameA == "ball" {
            nodeBall = contact.nodeA
            nodeDisk = contact.nodeB
        } else { // if nameB == "ball" {
            nodeBall = contact.nodeB
            nodeDisk = contact.nodeA
        }
        
        if arrBall[nodeBall] == nil {
            if nodeDisk.name == "diskUpper" {
                arrBall[nodeBall] = [1, 0]
            }
            if nodeDisk.name == "diskLower" {
                arrBall[nodeBall] = [0, 1]
            }
            return
        }
        
        if nodeDisk.name == "diskLower" {
            if arrBall[nodeBall] == [1, 0] {
                arrBall[nodeBall] = [1, 1]
                score += 1
            }
        }
    }
}
