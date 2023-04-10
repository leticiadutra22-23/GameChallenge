import Foundation
import SpriteKit

class GameStartScene: SKScene {

    var gameScene: GameScene {
        let scene = GameScene()
        scene.size = CGSize(width: 390, height: 844)
        scene.scaleMode = .fill
        return scene
    }

    override func didMove(to view: SKView) {
        setupBackground()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in touches {
            self.view?.presentScene(self.gameScene)
        }
    }
}

extension GameStartScene {
    func setupBackground() {
        let background = SKSpriteNode(imageNamed: "enemy")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        addChild(background)
    }
}
