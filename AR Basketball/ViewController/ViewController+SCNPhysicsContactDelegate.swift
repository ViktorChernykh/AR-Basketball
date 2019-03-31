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

        guard nameB == "ball" else { return }
            
        if nameA == "diskUpper" {
            if arrBall.firstIndex(of: contact.nodeB) == nil {
                arrBall.append(contact.nodeB)
                arrGoal.append(0)
            }
        }
        if nameA == "diskLower" {
            if let indexBall = arrBall.firstIndex(of: contact.nodeB) {
                if arrGoal[indexBall] == 0 {
                    arrGoal[indexBall] = 1
                    score += 1
                }
            }
        }
    }
}
