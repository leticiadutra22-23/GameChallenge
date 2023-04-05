import Foundation
import SpriteKit

extension GameScene {
    func setupBackground() {
        let background = SKSpriteNode(imageNamed: "sky")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        addChild(background)
    }
}
