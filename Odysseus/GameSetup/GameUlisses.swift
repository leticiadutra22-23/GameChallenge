import Foundation
import SpriteKit

extension GameScene {
    func setupUlisses() -> SKSpriteNode {
        let ulisses = SKSpriteNode()

        ulisses.name = "ulisses"
        ulisses.position = CGPoint(x: 200, y: 60)
        ulisses.size = CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/6.5)
        ulisses.zPosition = 1

        animateUlisses(ulisses)
        addChild(ulisses)
        return ulisses
    }
}
