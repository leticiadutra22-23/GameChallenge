import Foundation
import SpriteKit

extension GameScene {
    func animateProjectile(_ projectile: SKSpriteNode) {
        let projectileTexture = Projectile()
        let frameAction = SKAction.animate(with: projectileTexture.projectileFrames, timePerFrame: 0.3)
        projectile.run(SKAction.repeatForever(frameAction))
    }

    func animateUlisses(_ ulisses: SKSpriteNode) {
        let ulissesTexture = Ulisses()
        let frameAction = SKAction.animate(with: ulissesTexture.ulissesFrames, timePerFrame: 0.3)
        ulisses.run(SKAction.repeatForever(frameAction))
    }

    func animateEnemy(_ enemy: SKSpriteNode) {
        let enemyTexture = Enemy()
        let frameAction = SKAction.animate(with: enemyTexture.enemyFrames, timePerFrame: 0.3)
        enemy.run(SKAction.repeatForever(frameAction))
    }

    func animateEnemy2(_ enemy: SKSpriteNode) {
        let enemyTexture = Enemy2()
        let frameAction = SKAction.animate(with: enemyTexture.enemyFrames, timePerFrame: 0.3)
        enemy.run(SKAction.repeatForever(frameAction))
    }
}
