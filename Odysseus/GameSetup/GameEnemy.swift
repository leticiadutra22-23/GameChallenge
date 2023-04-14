import Foundation
import SpriteKit

extension GameScene {
    func createEnemy() {
        let enemy = SKSpriteNode()
        
        enemy.name = "enemy"
        enemy.size = CGSize(width: 84, height: 120)
        enemy.position = CGPoint(x: (spawnLanes?.randomElement()!)!, y: size.height + enemy.size.height/2)
        enemy.zPosition = 1
        if final! {
            enemyMovement2(enemy)
        } else {
            enemyMovement(enemy)
        }
        addChild(enemy)
    }
}
