import Foundation
import SpriteKit
import SwiftUI

class GameScene: SKScene {
    var spawnProjectiles: [SKSpriteNode] = []

    let spawnLanes: [Double] = [200, 100, 300]
    /*
     indexes for mechanicValue:
     [0] = score
     [1] = life
     [2] = isShooting
     [3] = refire
     [4] = shootingDelay
     [5] = final boss
     [6] = projectile velocity
     [7] = enemy movement duration
     [8] = enemy spawn velocity
     */
    var mechanicValues: [Double] = [ 0, 3, 1, 1, 0.1, 0, 20, 1.8, 0.25] {
        didSet {
            print("Values changed")
        }
    }

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
        if self.mechanicValues[2] == 1 {
            for touch in touches {
                createProjectile(touch)
                self.mechanicValues[2] = 0
                self.mechanicValues[3] = 1
            }
        }
        if self.mechanicValues[3] == 1 {
            perform(#selector(enableShooting), with: nil, afterDelay: self.mechanicValues[4])
            self.mechanicValues[3] = 0
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


//    var score: Int = 0 {
//        didSet {
//            if score == 5 {
//                self.shootingDelay = 0.1
//            }
//        }
//    }
//    var life: Int = 3
//    var isShooting = 1
//    var refire = 1
//    var shootingDelay = 0.5
//    var final: Bool = false
