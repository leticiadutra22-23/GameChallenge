import Foundation
import SpriteKit

extension GameScene {
    func projectileMovement(_ sprite: SKSpriteNode) {
        sprite.position = CGPoint(x: sprite.position.x, y: sprite.position.y + 15)
    }
    
    func enemyMovement(_ enemy: SKSpriteNode) { // split into animate and movement
        let enemyTexture = Enemy()
        let frameAction = SKAction.animate(with: enemyTexture.enemyFrames, timePerFrame: 0.3)
        let actionMove = SKAction.moveTo(y: -enemy.size.height/2, duration: 2.5)
        let actionRemove = SKAction.removeFromParent()
        
        enemy.run(SKAction.sequence([actionMove, actionRemove]))
        enemy.run(SKAction.repeatForever(frameAction))
    }
    
    func projectileHitEnemy(enemy: SKSpriteNode) {
        enemy.removeFromParent()
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
                }
            }
        }
        for enemy in hitEnemy {
            projectileHitEnemy(enemy: enemy)
        }
    }
    
    func setupEnemy() {
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(createEnemy), SKAction.wait(forDuration: 0.6)])))
    }
    
    func animateProjectile(_ projectile: SKSpriteNode) { // move to movement
        let projectileTexture = Projectile()
        let frameAction = SKAction.animate(with: projectileTexture.projectileFrames, timePerFrame: 0.3)
        projectile.run(SKAction.repeatForever(frameAction))
    }
}
