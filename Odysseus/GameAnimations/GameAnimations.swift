import Foundation
import SpriteKit

// frame 0.09 projectile, enemy
// frame 0.045 ulisses
// frame 0.0045 arm
extension GameScene {
    func animateProjectile(_ projectile: SKSpriteNode) {
        let projectileTexture = Projectile()
        let frameAction = SKAction.animate(with: projectileTexture.projectileFrames, timePerFrame: 0.18)
        projectile.run(SKAction.repeatForever(frameAction))
    }

    func animateUlisses(_ ulisses: SKSpriteNode) {
        let ulissesTexture = Ulisses()
        let frameAction = SKAction.animate(with: ulissesTexture.ulissesFrames, timePerFrame: 0.225)
        ulisses.run(SKAction.repeatForever(frameAction))
    }

    func animateEnemy(_ enemy: SKSpriteNode) {
        let enemyTexture = Enemy()
        let frameAction = SKAction.animate(with: enemyTexture.enemyFrames, timePerFrame: 0.27)
        enemy.run(SKAction.repeatForever(frameAction))
    }

    func animateEnemy2(_ enemy: SKSpriteNode) {
        let enemyTexture = Enemy2()
        let frameAction = SKAction.animate(with: enemyTexture.enemyFrames, timePerFrame: 0.27)
        enemy.run(SKAction.repeatForever(frameAction))
    }
    
    func animateBackground(_ background: SKSpriteNode) {
        let backgroundTexture = Background()
        let frameAction = SKAction.animate(with: backgroundTexture.backgroundFrames, timePerFrame: 0.27)
        background.run(SKAction.repeatForever(frameAction))
    }
    
    func animateArm(_ arm: SKSpriteNode) {
        let armTexture = Arm()
        let frameAction = SKAction.animate(with: armTexture.armFrames, timePerFrame: 0.045)
        arm.run(frameAction)
    }
}
