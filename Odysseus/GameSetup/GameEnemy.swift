import Foundation
import SpriteKit

extension GameScene {
    func createEnemy() {
        let enemy = SKSpriteNode()
        
        enemy.name = "enemy"
        enemy.size = CGSize(width: 80, height: 80)
        enemy.position = CGPoint(x: spawnLanes.randomElement()!, y: size.height + enemy.size.height/2) //get random positions for x
        
        enemyMovement(enemy)
        addChild(enemy)
    }
}
