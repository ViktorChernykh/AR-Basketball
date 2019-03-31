//
//  ViewController.swift
//  AR Basketball
//
//  Created by Viktor on 28/03/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//
import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var allThrowLabel: UILabel!
    
    var hoopAdded = false
    
    var score: Int = 0 {
        didSet {
            DispatchQueue.main.async {
                self.scoreLabel.text = "Goal: \(self.score)"
            }
        }
    }
    var allThrow: Int = 0 {
        didSet {
            DispatchQueue.main.async {
                self.allThrowLabel.text = "Throw: \(self.allThrow)"
            }
        }
    }
    var arrBall = [SCNNode]()
    var arrGoal = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.autoenablesDefaultLighting = true
        
        // Set the view's delegate
        sceneView.delegate = self
        
        sceneView.scene.physicsWorld.contactDelegate = self
        
        // Show statistics such as fps and timing information
        //sceneView.showsStatistics = true
        
        sceneView.debugOptions = [.showFeaturePoints]//, .showWorldOrigin]
        
        scoreLabel.text = "Goal: 0"
        allThrowLabel.text = "Throw: 0"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = .vertical
        
        // Run the view's session
        sceneView.session.run(configuration)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    override var prefersStatusBarHidden: Bool {
        return true

    }
}
