import Foundation
import SpriteKit

extension GameScene {
    func checkGameOver() {
        if self.life < 1 {
            gameOver()
        }
    }

    func gameOver() {
        UserDefaults.standard.set(self.score, forKey: "lastScore")
        if highestScore() { // remove later to update gameOver Scene.
            print(UserDefaults.standard.integer(forKey: "lastScore"))
            print(UserDefaults.standard.integer(forKey: "highestScore"))
        }
        self.score = 0
        self.life = 3
        self.view?.presentScene(self.gameOverScene)
    }

    func highestScore() -> Bool {
        if UserDefaults.standard.integer(forKey: "lastScore") > UserDefaults.standard.integer(forKey: "highestScore") {
            UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "lastScore"), forKey: "highestScore")
            return true
        }
        return false
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

    func incrementScore() {
        self.score += 10
        checkScore()
    }

    func decrementLife() {
        self.life -= 1
        checkGameOver()
    }

    func projectileHitEnemy(enemy: SKSpriteNode) {
        enemy.removeFromParent()
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
            perform(#selector(enableShooting), with: nil, afterDelay: shootingDelay)
            self.refire = 0
        }
    }

    func offGametouchedButton(_ touchLocation: CGPoint, _ buttonName: String) {
        let nodeAtPoint = atPoint(touchLocation)
        if let touchedNode = nodeAtPoint as? SKSpriteNode {
            if touchedNode.name?.starts(with: buttonName) == true {
                if self.name == "over" {
                    self.view?.presentScene(gameScene)
                } else if self.name == "start" {
                    self.view?.presentScene(gameScene)
                }
            }
        }
    }

    func projectileMovement(_ sprite: SKSpriteNode) {
        sprite.position = CGPoint(x: sprite.position.x, y: sprite.position.y + 15)
    }

    func resetupEnemy() {
        removeAction(forKey: "enemyMovement")
        run(SKAction.sequence([SKAction.wait(forDuration: (enemySpawnTime * 2) / 3), SKAction.run(setupEnemy)]))
    }

    func setupEnemy() {
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(createEnemy), SKAction.wait(forDuration: enemySpawnTime)])), withKey: "enemyMovement")
    }

    func enemyMovement(_ enemy: SKSpriteNode) {
        let actionMove = SKAction.moveTo(y: -enemy.size.height/2, duration: self.enemyDuration)
        let actionRemove = SKAction.removeFromParent()
        animateEnemy(enemy)

        enemy.run(SKAction.sequence([actionMove, actionRemove]))
    }

    func enemyMovement2(_ enemy: SKSpriteNode) {

        let actionMove = SKAction.moveTo(y: -enemy.size.height/2, duration: self.enemyDuration)
        let actionRemove = SKAction.removeFromParent()
        animateEnemy2(enemy)

        enemy.run(SKAction.sequence([actionMove, actionRemove]))
    }

    @objc func enableShooting() {
        self.isShooting = 1
    }
}
