import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {

//    var enemy: SKSpriteNode?

    var enemy: SKSpriteNode = {
        let enemy = SKSpriteNode()
        enemy.texture = SKTexture(imageNamed: "chocolate")
        enemy.size = CGSize(width: 70, height: 70)
        enemy.physicsBody = SKPhysicsBody(circleOfRadius: enemy.size.width/2)
        enemy.zPosition = 0
        enemy.physicsBody?.isDynamic = false

        return enemy
    }()

//    var bullet: SKSpriteNode?
    var bullet: SKSpriteNode = {
        let bullet = SKSpriteNode()
        bullet.texture = SKTexture(imageNamed: "chocolate")
        bullet.size = CGSize(width: 70, height: 70)
        bullet.physicsBody = SKPhysicsBody(circleOfRadius: bullet.size.width)
        bullet.zPosition = 0
        bullet.physicsBody?.isDynamic = true
        return bullet
    }()

    let enemyCategory: UInt32 = 1 << 1
    let bulletCategory: UInt32 = 1 << 2

    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self

        enemy.physicsBody?.categoryBitMask = enemyCategory
        bullet.physicsBody?.categoryBitMask = bulletCategory

//        enemy.physicsBody?.collisionBitMask = 0
//        bullet.physicsBody?.collisionBitMask = 0
//
//        bullet.physicsBody?.collisionBitMask = enemyCategory

        createNewEnemy()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        for touch in touches {
            createNewBullet(touch.location(in: self))
        }

    }

    func didBegin(_ contact: SKPhysicsContact) {
        print("Começou!!")

        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask

        switch contactMask {
        case bulletCategory | enemyCategory:
            let bulletNode = contact.bodyA.categoryBitMask == bulletCategory ? contact.bodyA.node : contact.bodyB.node
//            let enemyNode = contact.bodyB.categoryBitMask == enemyCategory ? contact.bodyB.node : contact.bodyB.node
            bulletNode?.removeFromParent()
//            enemyNode?.removeFromParent()
        default:
            print("same mistake again")

        }
    }

    func createNewBullet(_ position: CGPoint) {
//         let bulletOrigin : CGPoint = CGPoint(x: 200, y: 400)
         let moveBulletUp = SKAction.repeatForever(SKAction.moveBy(x: 0, y: 3, duration: 0.01))

         bullet = SKSpriteNode(imageNamed: "bullet")
        bullet.position = position
         bullet.run(moveBulletUp)

         bullet.physicsBody? = SKPhysicsBody(rectangleOf: (bullet.size))
         bullet.physicsBody?.categoryBitMask =  bulletCategory
         bullet.physicsBody?.contactTestBitMask = enemyCategory
         bullet.physicsBody?.collisionBitMask = 0
         bullet.physicsBody?.isDynamic = true
//         bullet.physicsBody?.usesPreciseCollisionDetection = true
         bullet.zPosition = 1

         self.addChild(bullet)
    }

    func createNewEnemy() {

           let moveEnemyDown = SKAction.repeatForever(SKAction.moveBy(x: 0, y: 0, duration: 0.01))
//           let rotateEnemy = SKAction.repeatForever(SKAction.rotate(byAngle: 25, duration: 5))

          let enemyXpos = 200
          let enemyYpos = 800
          let enemyOrigin: CGPoint = CGPoint(x: enemyXpos, y: enemyYpos)

          enemy = SKSpriteNode(imageNamed: "enemy")

//          enemy?.scale(to: CGSize(width: player.size.height, height: player.size.height))

          enemy.position = enemyOrigin
          enemy.run(moveEnemyDown)
//          enemy.run(rotateEnemy)
          let enemyRadius: CGFloat = (enemy.size.width)/2
          print(enemyRadius)

          enemy.physicsBody? = SKPhysicsBody(circleOfRadius: enemyRadius)

          enemy.physicsBody?.categoryBitMask = enemyCategory
          enemy.physicsBody?.contactTestBitMask = bulletCategory
          enemy.physicsBody?.collisionBitMask = 0
          enemy.zPosition = 1
          enemy.physicsBody?.isDynamic = true

          self.addChild(enemy)
    }
}
