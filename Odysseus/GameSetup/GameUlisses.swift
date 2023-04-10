import Foundation
import SpriteKit

extension GameScene {
    func setupUlisses() -> SKSpriteNode {
        let ulisses = SKSpriteNode()

        ulisses.name = "ulisses"
        ulisses.position = CGPoint(x: 200, y: 20)
        ulisses.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/10)

        animateUlisses(ulisses)
        addChild(ulisses)
        return ulisses
    }
}
