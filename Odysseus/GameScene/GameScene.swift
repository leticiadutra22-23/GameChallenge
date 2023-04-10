import Foundation
import SpriteKit
import SwiftUI

class GameScene: SKScene {
    var spawnProjectiles: [SKSpriteNode] = []

    let spawnLanes: [Double] = [200, 100, 300]

    var score: Int = 0

    var life: Int = 3

    var isShooting = 1

    var refire = 1

    var shootingDelay = 0.3

    var final: Bool = false

    var ulisses: SKSpriteNode = SKSpriteNode()

    var gameScene: GameOverScene {
        let scene = GameOverScene()
        scene.size = CGSize(width: 390, height: 844)
        scene.scaleMode = .fill
        return scene
    }
    
    override func didMove(to view: SKView) {
        setupBackground()
        self.ulisses = setupUlisses()
        setupEnemy()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.isShooting == 1 {
            for touch in touches {
                createProjectile(touch)
                self.isShooting = 0
                self.refire = 1
            }
        }
        if self.refire == 1 {
            perform(#selector(enableShooting), with: nil, afterDelay: shootingDelay)
            self.refire = 0
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        for projectile in spawnProjectiles {
            projectileMovement(projectile)
        }
    }

    override func didEvaluateActions() {
        checkCollision()
        checkUlissesCollision()
        checkScore()
        checkGameOver()
    }

    func gameOver() {
        self.view?.presentScene(self.gameScene)
    }

}
