import Foundation
import SpriteKit

extension GameScene {
    func createEnemy() {
        let enemy = SKSpriteNode()

        enemy.name = "enemy"
        enemy.size = CGSize(width: 84, height: 120)
        self.randomPosition = spawnLanes.randomElement()!
        var savedValue: Double = 0.0
        enemy.position = CGPoint(x: self.randomPosition, y: size.height + enemy.size.height/2)
        enemy.zPosition = 1
        if gameScene.score >= 1250 {
            enemyMovement2(enemy)
        } else {
            enemyMovement(enemy)
        }
        addChild(enemy)
        if self.randomPosition == 100 {
            savedValue = Double.random(in: 1 ... 133).rounded(.towardZero)
        }
        if self.randomPosition == 200 {
            savedValue = Double.random(in: 134 ... 265).rounded(.towardZero)
        }
        if self.randomPosition == 300 {
            savedValue = Double.random(in: 266 ... 400).rounded(.towardZero)
        }
        createAiProjectile( sum([bias, savedValue], &weights1, &weights2, learningRate))
    }
}

