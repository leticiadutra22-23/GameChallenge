//
//  GameSceneColide.swift
//  Odysseus
//
//  Created by Emilly Maia on 03/04/23.
//

import Foundation
import SpriteKit

class GameSceneColide: SKScene {

    var updateTime: TimeInterval = 0
    var deltaTime: TimeInterval = 0

    var value = 2.5 // enemy drop speed

    var isShooting: Bool = false

    var bulletArray: [SKSpriteNode] = []

    let playableRect: CGRect

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

        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(setupEnemy), SKAction.wait(forDuration: 0.4)])))
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
        bullet.name = "bullet"
        bullet.position = CGPoint(x: touch.location(in: self).x, y: 100)
        bullet.size = CGSize(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/10)
        bulletArray.append(bullet)
        addChild(bullet)
    }

    private func setupEnemy() {
        let enemy = SKSpriteNode(imageNamed: "enemy")
        enemy.name = "enemy"
        enemy.position = CGPoint(x: CGFloat.random(min: CGRectGetMinX(playableRect) + enemy.size.width, max: CGRectGetMaxX(playableRect) - enemy.size.width/2), y: size.height + enemy.size.height/2)
        enemy.size = CGSize(width: 100, height: 100)
        addChild(enemy)

        let actionMove = SKAction.moveTo(y: -enemy.size.height/2, duration: value)
        let actionRemove = SKAction.removeFromParent()

        enemy.run(SKAction.sequence([actionMove, actionRemove]))
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            setupBullet(touch: touch)
        }
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
        print("Hit")
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
