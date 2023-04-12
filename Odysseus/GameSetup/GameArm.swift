import Foundation
import SpriteKit

extension GameScene {
    func setupArm() -> [SKSpriteNode] {
        var arms: [SKSpriteNode] = []
        
        let arm = SKSpriteNode(imageNamed: "canhao1")
        arm.position = CGPoint(x: self.spawnLanes[0], y: 80)
        arm.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        arm.zPosition = 0
        arm.size = CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/6.5)
        arms.append(arm)
        
        let arm2 = SKSpriteNode(imageNamed: "canhao1")
        arm2.position = CGPoint(x: self.spawnLanes[1], y: 80)
        arm2.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        arm2.zPosition = 0
        arm2.size = CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/6.5)
        arms.append(arm2)
        
        let arm3 = SKSpriteNode(imageNamed: "canhao1")
        arm3.position = CGPoint(x: self.spawnLanes[2], y: 80)
        arm3.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        arm3.zPosition = 0
        arm3.size = CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/6.5)
        arms.append(arm3)
        
//        animateArm(arm)
        for arm in arms {
            addChild(arm)
//            animateArm(arm)
        }
        
        return arms
    }
}
