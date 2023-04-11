import Foundation
import SpriteKit

class GameOverScene: SKScene {

    var gameScene: GameStartScene {
        let scene = GameStartScene()
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

extension GameOverScene {
    func setupBackground() {
        let background = SKSpriteNode(imageNamed: "gameover")
        background.size = CGSize(width: 295.98, height: 161.62)
        background.position = CGPoint(x: size.width/2, y: size.height * 0.7)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
       // background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        addChild(background)
    }
}
