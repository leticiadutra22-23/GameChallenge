import SpriteKit
import GameplayKit

var enemy: SKSpriteNode = {
    let enemy = SKSpriteNode()
    enemy.physicsBody = SKPhysicsBody(rectangleOf: enemy.size)
    enemy.physicsBody?.affectedByGravity = false
    enemy.physicsBody?.contactTestBitMask = enemyCategory
    enemy.size = enemySize
    enemy.physicsBody?.allowsRotation = false
    enemy.physicsBody?.isDynamic = true
    enemy.name = "enemy"
    return enemy
}()
var enemySize = CGSize(width: 20, height: 20)
var enemySpeed = 2.1
var enemyFallTime = 0.7

var bullet: SKSpriteNode = {
    let bullet = SKSpriteNode()
    bullet.texture = SKTexture(imageNamed: "chocolate")
    bullet.size = CGSize(width: 70, height: 70)
    bullet.physicsBody = SKPhysicsBody(circleOfRadius: bullet.size.width)
    bullet.zPosition = 0
    bullet.physicsBody?.isDynamic = true
    bullet.name = "bullet"
    return bullet
}()

let enemyCategory: UInt32 = 2
let bulletCategory: UInt32 = 1 << 2

class GameScene: SKScene, SKPhysicsContactDelegate {
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        bullet.physicsBody?.categoryBitMask = bulletCategory
        timeCreateEnemy()
        checkCollision()
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
            bulletNode?.removeFromParent()
        default:
            print("same mistake again")
        }
    }
    func createNewBullet(_ position: CGPoint) {
        let moveBulletUp = SKAction.repeatForever(SKAction.moveBy(x: 0, y: 2, duration: 0.01))
        bullet = SKSpriteNode(imageNamed: "bullet")
        bullet.position = position
        bullet.run(moveBulletUp)
        bullet.physicsBody? = SKPhysicsBody(rectangleOf: (bullet.size))
        bullet.physicsBody?.categoryBitMask =  bulletCategory
        bullet.physicsBody?.contactTestBitMask = enemyCategory
        bullet.physicsBody?.collisionBitMask = 0
        bullet.physicsBody?.isDynamic = true
        bullet.zPosition = 1
        self.addChild(bullet)
    }
    func createEnemy() {
        let xPos = randomNumbers(firstNum: 0, secondNum: frame.height)
        enemy = SKSpriteNode(imageNamed: "enemy")
        enemy.position = CGPoint(x: xPos - 500, y: self.frame.size.height)
        moveEnemyToFloor()
        addChild(enemy)
    }
    func moveEnemyToFloor() {
        let moveTo = SKAction.moveTo(y: 300, duration: enemySpeed)
        let destroy = SKAction.removeFromParent()
        enemy.run(SKAction.sequence([moveTo, destroy]))
    }
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    func timeCreateEnemy() {
        let wait = SKAction.wait(forDuration: enemyFallTime)
        let spawn = SKAction.run {
            self.createEnemy()
        }
        let sequence = SKAction.sequence([wait, spawn])
        self.run(SKAction.repeatForever(sequence))
    }
    func checkCollision() {
        var hit: [SKSpriteNode] = []
        enumerateChildNodes(withName: "enemy") { node, _ in
            let enemy = node as! SKSpriteNode
            if CGRectIntersectsRect(enemy.frame, bullet.frame) {
                hit.append(enemy)
            }
        }

//        for enemy in hit {
//            print("Hit")
//        }
    }
}
