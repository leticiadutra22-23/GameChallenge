import Foundation
import SpriteKit
import SwiftUI

class GameScene: SKScene {

    var spawnProjectiles: [SKSpriteNode]? // = []
    var spawnLanes: [Double]? // = [200, 100, 300]
    var score2: SKLabelNode? // = SKLabelNode()
    var score: Int? { // = 0
        didSet {
            score2?.text = String(score!)
        }
    }
    var life: Int? { // = 3
        didSet {
            if life == 2 {
                self.life2?.texture = SKTexture(imageNamed: "life2")
            }
            if life == 1 {
                self.life2?.texture = SKTexture(imageNamed: "life1")
            }
        }
    }
    var life2: SKSpriteNode? // = SKSpriteNode(imageNamed: "life3")
    var isShooting: Double? // = 1
    var refire: Double? // = 1
    var shootingDelay: Double? // = 0.3
    var final: Bool? // = false
    var ulisses: SKSpriteNode? // = SKSpriteNode()
    var arms: [SKSpriteNode]? // = []

    var gameOverScene: GameScene {
        let scene = GameScene()
        scene.name = "over"
        scene.size = CGSize(width: 390, height: 844)
        scene.scaleMode = .fill
        return scene
    }
    var gameStartScene: GameScene {
        let scene = GameScene()
        scene.name = "start"
        scene.size = CGSize(width: 390, height: 844)
        scene.scaleMode = .fill
        return scene
    }
    var gameScene: GameScene {
        let scene = GameScene()
        scene.name = "game"
        scene.size = CGSize(width: 390, height: 844)
        scene.scaleMode = .aspectFit
        return scene
    }

    
    override func didMove(to view: SKView) {
        if setupBackground(self.name) {
            self.ulisses = setupUlisses()
            self.arms = setupArm()
            setupEnemy()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.name == "game" {
            gameTouch(touches)
        } else {
            guard let touch = touches.first else { return }
            let touchLocation = touch.location(in: self)
            offGametouchedButton(touchLocation, "startButton")
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if self.name == "game" {
            for projectile in spawnProjectiles! {
                projectileMovement(projectile)
            }
        }
    }

    override func didEvaluateActions() {
        if self.name == "game" {
            checkCollision()
            checkUlissesCollision()
    //        checkScore()
            checkGameOver()
        }
    }

    func gameOver() {
        self.view?.presentScene(self.gameOverScene)
    }

    func gameTouch(_ touches: Set<UITouch>) {
        if self.isShooting == 1 {
            for touch in touches {
                createProjectile(touch)
                self.isShooting = 0
                self.refire = 1
            }
        }
        if self.refire == 1 {
            perform(#selector(enableShooting), with: nil, afterDelay: shootingDelay!)
            self.refire = 0
        }
    }

    func offGametouchedButton(_ touchLocation: CGPoint, _ buttonName: String) {
        let nodeAtPoint = atPoint(touchLocation)
        if let touchedNode = nodeAtPoint as? SKSpriteNode {
            if touchedNode.name?.starts(with: buttonName) == true {
                if self.name == "over" {
                    self.view?.presentScene(gameStartScene)
                } else if self.name == "start" {
                    self.view?.presentScene(gameScene)
                }
            }
        }
    }
}
