import Foundation
import SpriteKit

extension GameScene {
    func projectileMovement(_ sprite: SKSpriteNode) {
        sprite.position = CGPoint(x: sprite.position.x, y: sprite.position.y + 15)
    }
    
    func enemyMovement(_ enemy: SKSpriteNode) {
        let actionMove = SKAction.moveTo(y: -enemy.size.height/2, duration: 2.5)
        let actionRemove = SKAction.removeFromParent()
        animateEnemy(enemy)

        enemy.run(SKAction.sequence([actionMove, actionRemove]))
    }

    func enemyMovement2(_ enemy: SKSpriteNode) {
        
        let actionMove = SKAction.moveTo(y: -enemy.size.height/2, duration: 2.5)
        let actionRemove = SKAction.removeFromParent()
        animateEnemy2(enemy)

        enemy.run(SKAction.sequence([actionMove, actionRemove]))
    }
    
    func projectileHitEnemy(enemy: SKSpriteNode) {
        enemy.removeFromParent()
    }

    func checkScore() {
        if self.score > 100 {
            self.score = 0
        }
    }

    func checkGameOver() {
        if self.life < 1 {
            gameOver()
            self.score = 0
            self.life = 3
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
            for arm in self.arms {
                if CGRectIntersectsRect(
                    CGRectInset(enemy.frame, 15, 15), arm.frame) {
                    self.projectileHitEnemy(enemy: enemy)
                    self.decrementLife()
                }
            }
        }
    }
    
    func setupEnemy() {
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(createEnemy), SKAction.wait(forDuration: 0.6)])))
    }

    func incrementScore() {
        self.score += 10
    }

    func decrementLife() {
        self.life -= 1
    }

    @objc func enableShooting() {
        self.isShooting = 1
    }
}
