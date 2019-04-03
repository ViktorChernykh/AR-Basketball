//
//  ViewController+@IBAction.swift
//  AR Basketball
//
//  Created by Viktor on 28/03/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import UIKit

extension ViewController {
    
    @IBAction func screenTapped(_ sender: UITapGestureRecognizer) {
        
        if !hoopAdded {
            // get 2D coordinate from tapped
            let location = sender.location(in: sceneView)
            // Existence 3 methods with name hitTest
            // result - array with the found planes from the nearest (first) to the far
            let results = sceneView.hitTest(location, types: [.existingPlaneUsingExtent])
            guard let result = results.first else { return }

            guard let hoop = Hoop.createHoop(result: result) else { return }
            
            hoopAdded = true
            Hoop.removeWall(at: sceneView)
            sceneView.scene.rootNode.addChildNode(hoop)
            
            guard let diskUpper = Disk(at: sceneView, fromY: DiskLevel.upperDisk) else { return }
            guard let diskLower = Disk(at: sceneView, fromY: DiskLevel.lowerDisk) else { return }
            guard let diskFloor = Disk(at: sceneView, fromY: DiskLevel.floor) else { return }
            
            sceneView.scene.rootNode.addChildNode(diskUpper)
            sceneView.scene.rootNode.addChildNode(diskLower)
            sceneView.scene.rootNode.addChildNode(diskFloor)
            
            sceneView.debugOptions = []
            
        } else {
            guard let basketball = Basketball(at: sceneView) else { return }
            sceneView.scene.rootNode.addChildNode(basketball)
            allThrow += 1
        }
    }
}
