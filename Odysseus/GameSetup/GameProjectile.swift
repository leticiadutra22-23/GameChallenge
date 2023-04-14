import Foundation
import SpriteKit

extension GameScene {
    func createProjectile(_ touch: UITouch) {
        let projectile = SKSpriteNode()
        let xPosition = touch.location(in: self).x
        
        projectile.name = "projectile"
        
        if xPosition > 134 && xPosition < 266 {
            projectile.position = CGPoint(x: (spawnLanes?[0])!, y: 90)
            self.ulisses?.position = CGPoint(x: (spawnLanes?[0])!, y: 60)
            animateArm((arms?[0])!)
        }
        if xPosition <= 134 {
            projectile.position = CGPoint(x: (spawnLanes?[1])!, y: 90)
            self.ulisses?.position = CGPoint(x: (spawnLanes?[1])!, y: 60)
            animateArm((arms?[1])!)
        }
        if xPosition >= 266 {
            projectile.position = CGPoint(x: (spawnLanes?[2])!, y: 90)
            self.ulisses?.position = CGPoint(x: (spawnLanes?[2])!, y: 60)
            animateArm((arms?[2])!)
        }
        
        projectile.size = CGSize(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/10)
        spawnProjectiles?.append(projectile)
        animateProjectile(projectile)
        addChild(projectile)
    }
}
