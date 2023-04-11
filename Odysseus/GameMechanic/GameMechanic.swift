import Foundation
import SpriteKit

extension GameScene {
    func projectileMovement(_ sprite: SKSpriteNode) {
        sprite.position = CGPoint(x: sprite.position.x, y: sprite.position.y + self.mechanicValues[6])
    }
    
    func enemyMovement(_ enemy: SKSpriteNode) {
        let actionMove = SKAction.moveTo(y: -enemy.size.height/2, duration: self.mechanicValues[7])
        let actionRemove = SKAction.removeFromParent()
        animateEnemy(enemy)

        enemy.run(SKAction.sequence([actionMove, actionRemove]))
    }

    func enemyMovement2(_ enemy: SKSpriteNode) { // teoricamente o projetil atirado pelo chefão.
        let actionMove = SKAction.moveTo(y: -enemy.size.height/2, duration: self.mechanicValues[7])
        let actionRemove = SKAction.removeFromParent()
        animateEnemy2(enemy)

        enemy.run(SKAction.sequence([actionMove, actionRemove]))
    }
    
    func projectileHitEnemy(enemy: SKSpriteNode) {
        enemy.removeFromParent()
    }

    func checkScore() { // verificador de fase.
        if self.mechanicValues[0] > 10 {
            self.mechanicValues[0] = 0
        }
    }

    func checkGameOver() {
        if self.mechanicValues[1] < 1 {
            self.mechanicValues[0] = 0
            self.mechanicValues[1] = 3
            gameOver()
        }
    }
    
    func checkCollision() {
        var hitEnemy: [SKSpriteNode] = []
        enumerateChildNodes(withName: "enemy") { node, _ in
            let enemy = node as! SKSpriteNode
            for projectile in self.spawnProjectiles {
                if CGRectIntersectsRect(
                    CGRectInset(enemy.frame, 15, 15), projectile.frame) {
                    guard let index = self.spawnProjectiles.firstIndex(of: projectile) else { return }
                    self.spawnProjectiles.remove(at: index)
                    projectile.removeFromParent()
                    hitEnemy.append(enemy)
                    self.incrementScore()
                }
            }
        }
        for enemy in hitEnemy {
            projectileHitEnemy(enemy: enemy)
        }
    }

    func checkUlissesCollision() {
        enumerateChildNodes(withName: "enemy") { node, _ in
            let enemy = node as! SKSpriteNode
            if CGRectIntersectsRect(
                CGRectInset(enemy.frame, 15, 15), self.ulisses.frame) {
                self.projectileHitEnemy(enemy: enemy)
                self.decrementLife()
            }
        }
    }
    
    func setupEnemy() {
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(createEnemy), SKAction.wait(forDuration: self.mechanicValues[8])])))
    }

    func incrementScore() {
        self.mechanicValues[0] += 1
    }

    func decrementLife() {
        self.mechanicValues[1] -= 1
    }

    @objc func enableShooting() {
        self.mechanicValues[2] = 1
    }

}
