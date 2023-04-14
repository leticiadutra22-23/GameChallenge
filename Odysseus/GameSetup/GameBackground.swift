import Foundation
import SpriteKit

extension GameScene {
    func setupBackground(_ name: String?) -> Bool {
        if name == "game" {
            setupGameBackground()
            return true
        } else if name == "over" {
            setupOverBackground()
            return false
        } else {
            setupStartBackground()
            return false
        }
    }

    private func setupGameBackground() {

        self.spawnProjectiles = []
        self.spawnLanes = [200, 100, 300]
        self.score2 = SKLabelNode()
        self.score = 0
        self.life = 3
        self.life2 = SKSpriteNode(imageNamed: "life3")
        self.isShooting = 1
        self.refire = 1
        self.shootingDelay = 0.3
        self.final = false
        self.ulisses = SKSpriteNode()
        self.arms = []
        
        let background = SKSpriteNode()
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

        animateBackground(background)
        addChild(background)

        life2?.position = CGPoint(x: 75, y: 775)
        life2?.size = CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/16)
        life2?.zPosition = 2
        addChild(life2!)

        score2?.position = CGPoint(x: 325, y: 765)
        score2?.text = "0"
        score2?.zPosition = 2
        addChild(score2!)

    }

    private func setupOverBackground() {
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

    private func setupStartBackground() {
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
