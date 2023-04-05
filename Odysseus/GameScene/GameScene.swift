import Foundation
import SpriteKit

class GameScene: SKScene {

    var spawnProjectiles: [SKSpriteNode] = []
    
    override func didMove(to view: SKView) {
        setupBackground()
        setupEnemy()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            createProjectile(touch)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        for projectile in spawnProjectiles {
            projectileMovement(projectile)
        }
    }

    override func didEvaluateActions() {
        checkCollision()
    }

}
