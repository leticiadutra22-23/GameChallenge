import Foundation
import SpriteKit

extension GameScene {
    func setupBackground() {
        let background = SKSpriteNode()
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        animateBackground(background)
        addChild(background)
        
        life2.position = CGPoint(x: 75, y: 775)
        life2.size = CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/16)
        life2.zPosition = 2
        addChild(life2)
        
        score2.position = CGPoint(x: 325, y: 765)
        score2.text = "0"
        score2.zPosition = 2
        addChild(score2)
        
    }
}

extension GameOverScene {
    func setupBackground() {
        let background = SKSpriteNode(imageNamed: "gameover")
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)

        addChild(background)
        
        let jogarNovamenteButton = SKSpriteNode(imageNamed: "jogarNovamente")
        jogarNovamenteButton.position = CGPoint(x: size.width/2, y: size.height/2)
        jogarNovamenteButton.size = CGSize(width: 236, height: 87)
        jogarNovamenteButton.name = "jogarNovamente"
        addChild(jogarNovamenteButton)
        
        let voltarMenuButton = SKSpriteNode(imageNamed: "voltarMenu")
        voltarMenuButton.position = CGPoint(x: size.width/2, y: size.height/2.5)
        voltarMenuButton.size = CGSize(width: 236, height: 77)
        voltarMenuButton.name = "voltarMenu"
        addChild(voltarMenuButton)
    }
    

}


extension GameStartScene {
    func setupBackground() {
        let background = SKSpriteNode(imageNamed: "menu")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        addChild(background)
        
        let startButton = SKSpriteNode(imageNamed: "startButton")
        startButton.position = CGPoint(x: size.width/2, y: size.height/3.5)
        startButton.size = CGSize(width: 236, height: 97)
        startButton.name = "startButton"
        addChild(startButton)
    }
}
