import Foundation
import SpriteKit

extension GameScene {
    func setupArm() -> SKSpriteNode {
        let arm = SKSpriteNode()
        
        arm.position = CGPoint(x: 200, y: 80)
        arm.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        arm.zPosition = 0
        arm.size = CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/6.5)
        
        animateArm(arm)
        addChild(arm)
        return arm
    }
}
