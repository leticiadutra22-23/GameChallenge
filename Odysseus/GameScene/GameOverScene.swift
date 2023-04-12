import Foundation
import SpriteKit

class GameOverScene: SKScene {

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
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        touchedButton(touchLocation: touchLocation, buttonName: "startButton")
    }
    
    func touchedButton(touchLocation: CGPoint, buttonName: String) {
        let nodeAtPoint = atPoint(touchLocation)
        if let touchedNode = nodeAtPoint as? SKSpriteNode {
            if touchedNode.name?.starts(with: buttonName) == true {
                self.view?.presentScene(self.gameScene)
            }
        }
    }
}

extension GameOverScene {
    func setupBackground() {
        let background = SKSpriteNode(imageNamed: "gameover")
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)

        addChild(background)
        
        let gameOverButton = SKSpriteNode(imageNamed: "startButton")
        gameOverButton.position = CGPoint(x: size.width/2, y: size.height/3.5)
        gameOverButton.size = CGSize(width: 236, height: 97)
        gameOverButton.name = "startButton"
        addChild(gameOverButton)
    }
}
