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
        
        print(nameA, nameB)
        
        guard (nameA == "ball") || (nameB == "ball") else { return }

        guard (nameA == "diskUpper") || (nameB == "diskUpper") ||
            (nameA == "diskLower") || (nameB == "diskLower") ||
            (nameA == "floor") || (nameB == "floor") else { return }

        var nodeBall = SCNNode()
        var nodeDisk = SCNNode()

        if nameA == "ball" {
            nodeBall = contact.nodeA
            nodeDisk = contact.nodeB
        } else { // if nameB == "ball" {
            nodeBall = contact.nodeB
            nodeDisk = contact.nodeA
        }

        if nodeDisk.name == "floor" {
            nodeBall.removeFromParentNode()            
            return
        }
        
        if arrBall[nodeBall] == nil {
            if nodeDisk.name == "diskUpper" {
                arrBall[nodeBall] = BitMaskDisk.upperDisk
            }
            if nodeDisk.name == "diskLower" {
                arrBall[nodeBall] = BitMaskDisk.lowerDisk
            }
            return
        }
        
        if nodeDisk.name == "diskLower" {
            if arrBall[nodeBall] == BitMaskDisk.upperDisk {
                arrBall[nodeBall] = (BitMaskDisk.upperDisk | BitMaskDisk.lowerDisk)
                score += 1
            }
        }
    }
}
