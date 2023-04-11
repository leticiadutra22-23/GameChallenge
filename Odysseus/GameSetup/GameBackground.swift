import Foundation
import SpriteKit

extension GameScene {
    func setupBackground() {
        let background = SKSpriteNode()
        
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        animateBackground(background)
        addChild(background)
//        return background
    }
}
