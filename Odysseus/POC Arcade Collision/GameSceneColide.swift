import Foundation
import SpriteKit

class GameSceneColide: SKScene {

    var updateTime: TimeInterval = 0
    var deltaTime: TimeInterval = 0

    var value = 2.5 // enemy drop speed

    var refire = 1

    var life = 10 {
        didSet {
//            print("\(life)")
        }
    }

    var isShooting: Bool = true {
        didSet {
//            print(isShooting)
        }
    }

    var xArray: [CGFloat] = [100, 200, 300]

    var shootingDelay: TimeInterval = 0.8

    var bulletArray: [SKSpriteNode] = []

    let playableRect: CGRect

    let lifeLine: SKSpriteNode = {
        let lifeLine = SKSpriteNode()
        lifeLine.name = "lifeLine"
        lifeLine.position = CGPoint(x: 200, y: 20)
        lifeLine.color = .blue
        lifeLine.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/20)
        return lifeLine
    }()

    override init(size: CGSize) {
        let maxAspectRatio: CGFloat = 9/16
        let playableWidth = size.width / maxAspectRatio
        let playableMargin = (size.width-playableWidth)/2.0
        playableRect = CGRect(x: playableMargin, y: 0, width: playableWidth, height: size.height)
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        setupBackground()
        addChild(lifeLine)
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(setupEnemy), SKAction.wait(forDuration: 1.5)])))
    }

    private func setupBackground() {
        let background = SKSpriteNode(imageNamed: "sky")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = -1
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        addChild(background)
    }

    private func setupBullet(touch: UITouch) {
        let bullet = SKSpriteNode(imageNamed: "bullet")
        let xPos = touch.location(in: self).x
        bullet.name = "bullet"
        bullet.position = CGPoint(x: 200, y: 100)
        if xPos < 134 {
            bullet.position = CGPoint(x: 100, y: 100)
        }
        if xPos > 266 {
            bullet.position = CGPoint(x: 300, y: 100)
        }
        bullet.size = CGSize(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/10)
        bulletArray.append(bullet)
        addChild(bullet)
    }

    private func setupEnemy() {
        let enemy = SKSpriteNode(imageNamed: "enemy")
        enemy.name = "enemy"
        enemy.position = CGPoint(x: xArray.randomElement()!, y: size.height + enemy.size.height/2)
        enemy.size = CGSize(width: 100, height: 100)
        addChild(enemy)

        let actionMove = SKAction.moveTo(y: -enemy.size.height/2, duration: value)
        let actionRemove = SKAction.removeFromParent()

        enemy.run(SKAction.sequence([actionMove, actionRemove]))
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isShooting {
            for touch in touches {
                setupBullet(touch: touch)
                isShooting = false
                refire = 1
            }
        }
        if refire == 1 {
            perform(#selector(enableShooting), with: nil, afterDelay: shootingDelay)
            refire = 0
        }


    }

    @objc func enableShooting() {
        isShooting = true
//        print("shooting delay")
    }

    override func update(_ currentTime: TimeInterval) {
        if updateTime > 0 {
            deltaTime = currentTime - updateTime
        } else {
            deltaTime = 0
        }
        updateTime = currentTime

        for bullet in bulletArray {
            shoot(sprite: bullet)
        }

    }

    override func didEvaluateActions() {
        checkCollision()
        checkLifeCollision()
    }

    func shoot(sprite: SKSpriteNode) {
        sprite.position = CGPoint(x: sprite.position.x, y: sprite.position.y + 30) // bullet speed
    }

    func checkCollision() {
        var hitEnemy: [SKSpriteNode] = []
        enumerateChildNodes(withName: "enemy") { node, _ in
            let enemy = node as! SKSpriteNode
            for bullet in self.bulletArray {
                if CGRectIntersectsRect(
                    CGRectInset(enemy.frame, 15, 15), bullet.frame) {
                    guard let index = self.bulletArray.firstIndex(of: bullet) else { return }
                    self.bulletArray.remove(at: index)
                    bullet.removeFromParent()
                    hitEnemy.append(enemy)
                }
            }
        }
        for enemy in hitEnemy {
            bulletHitEnemy(enemy: enemy)
        }
    }

    func bulletHitEnemy(enemy: SKSpriteNode) {
        enemy.removeFromParent()
    }

    func checkLifeCollision() {
//        var lifeHitEnemy: [SKSpriteNode] = []
        enumerateChildNodes(withName: "enemy") { node, _ in
            let enemy = node as! SKSpriteNode
            if CGRectIntersectsRect(
                CGRectInset(enemy.frame, 15, 15), self.lifeLine.frame) {
//                lifeHitEnemy.append(enemy)
                self.life = self.life - 1
                self.bulletHitEnemy(enemy: enemy)
            }
        }
    }
}


extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UInt32.max))
    }
    static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        assert(min<max)
        return CGFloat.random() * (max - min) + min
    }
}
