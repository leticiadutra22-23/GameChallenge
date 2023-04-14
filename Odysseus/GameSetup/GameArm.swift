import Foundation
import SpriteKit

extension GameScene {
    func setupArm() -> [SKSpriteNode]  {
        
        let size2 = CGSize(width: 89, height: 92)

        var arms: [SKSpriteNode] = []
        
        let arm = SKSpriteNode(imageNamed: "canhao1")
        arm.position = CGPoint(x: (self.spawnLanes?[0])!, y: 80)
        arm.size = size2
        arm.zPosition = 0
        arms.append(arm)
        
        let arm2 = SKSpriteNode(imageNamed: "canhao1")
        arm2.position = CGPoint(x: (self.spawnLanes?[1])!, y: 80)
        arm2.size = size2
        arm2.zPosition = 0
        arms.append(arm2)
        
        let arm3 = SKSpriteNode(imageNamed: "canhao1")
        arm3.position = CGPoint(x: (self.spawnLanes?[2])!, y: 80)
        arm3.size = size2
        arm3.zPosition = 0
        arms.append(arm3)
        
        for arm in arms {
            addChild(arm)
        }
        
        return arms
    }
}

// arm.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
