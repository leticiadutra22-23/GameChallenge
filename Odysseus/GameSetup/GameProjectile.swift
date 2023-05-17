import Foundation
import SpriteKit

extension GameScene {
    func createProjectile(_ touch: UITouch) {
        let projectile = SKSpriteNode()
        let xPosition = touch.location(in: self).x

        projectile.name = "projectile"

        if xPosition <= 133 {
            projectile.position = CGPoint(x: spawnLanes[0], y: 90)
            self.ulisses.position = CGPoint(x: spawnLanes[0], y: 60)
            if gameScene.score >= 1250 {
                animateFinalArm(arms[0])
            } else {
                animateArm(arms[0])
            }

        } else if xPosition >= 266 {
            projectile.position = CGPoint(x: spawnLanes[2], y: 90)
            self.ulisses.position = CGPoint(x: spawnLanes[2], y: 60)
            if gameScene.score >= 1250 {
                animateFinalArm(arms[2])
            } else {
                animateArm(arms[2])
            }
        } else {
            projectile.position = CGPoint(x: spawnLanes[1], y: 90)
            self.ulisses.position = CGPoint(x: spawnLanes[1], y: 60)
            if gameScene.score >= 1250 {
                animateFinalArm(arms[1])
            } else {
                animateArm(arms[1])
            }
        }

        projectile.size = CGSize(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/10)
        spawnProjectiles.append(projectile)

        if gameScene.score >= 1250 {
            animateFlamesProjectile(projectile)
        } else {
            animateProjectile(projectile)
        }
        addChild(projectile)
    }

    func createAiProjectile(_ result: [Double]) {
        let projectile = SKSpriteNode()
//        let xPosition = touch.location(in: self).x

        projectile.name = "projectile"

        if (result[0] == 0.0) && (result[1] == -1.0) { //esquerda
            projectile.position = CGPoint(x: spawnLanes[0], y: 90)
            self.ulisses.position = CGPoint(x: spawnLanes[0], y: 60)
            animateArm(arms[0])
//            if gameScene.score >= 1250 {
//                animateFinalArm(arms[0])
//            } else {
//                animateArm(arms[0])
//            }

        } else if (result[0] == 1.0) && (result[1] == 1.0) { // direita
            projectile.position = CGPoint(x: spawnLanes[2], y: 90)
            self.ulisses.position = CGPoint(x: spawnLanes[2], y: 60)
            animateArm(arms[2])
//            if gameScene.score >= 1250 {
//                animateFinalArm(arms[2])
//            } else {
//                animateArm(arms[2])
//            }
        } else { // meio
            projectile.position = CGPoint(x: spawnLanes[1], y: 90)
            self.ulisses.position = CGPoint(x: spawnLanes[1], y: 60)
            animateArm(arms[1])
//            if gameScene.score >= 1250 {
//                animateFinalArm(arms[1])
//            } else {
//                animateArm(arms[1])
//            }
        }

        projectile.size = CGSize(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/10)
        spawnProjectiles.append(projectile)
        animateProjectile(projectile)

//        if gameScene.score >= 1250 {
//            animateFlamesProjectile(projectile)
//        } else {
//            animateProjectile(projectile)
//        }
        addChild(projectile)
    }
}

