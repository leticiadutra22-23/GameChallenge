import Foundation
import SpriteKit
import SwiftUI

class GameScene: SKScene {
    var spawnProjectiles: [SKSpriteNode] = []
    var spawnLanes: [Double] = [200, 100, 300]
    var showScore: SKLabelNode = SKLabelNode()
    var score: Int = 0 {
        didSet {
            showScore.text = String(score)
        }
    }
    var life: Int = 3 {
        didSet {
            if life == 2 {
                self.showLife.texture = SKTexture(imageNamed: "life2")
            }
            if life == 1 {
                self.showLife.texture = SKTexture(imageNamed: "life1")
            }
        }
    }
    var showLife: SKSpriteNode = SKSpriteNode(imageNamed: "life3")
    var isShooting: Double = 1
    var refire: Double = 1
    var shootingDelay: Double = 0.3
    var enemyDuration: Double = 2.5
    var enemySpawnTime: Double = 0.7 {
        didSet {
            resetupEnemy()
        }
    }
    var final: Bool = false
    var ulisses: SKSpriteNode = SKSpriteNode()
    var arms: [SKSpriteNode] = []

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
        scene.scaleMode = .fill
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
            for projectile in spawnProjectiles {
                projectileMovement(projectile)
            }
        }
    }

    override func didEvaluateActions() {
        if self.name == "game" {
            checkCollision()
            checkUlissesCollision()
        }
    }
}
