import Foundation
import SpriteKit

extension GameScene {
    func setupUlisses() -> SKSpriteNode {
        let ulisses = SKSpriteNode()

        ulisses.name = "ulisses"
        ulisses.position = CGPoint(x: spawnLanes[0], y: 60)
        ulisses.size = CGSize(width: 89, height: 92)
        ulisses.zPosition = 1

        animateUlisses(ulisses)
        addChild(ulisses)
        return ulisses
    }
}
