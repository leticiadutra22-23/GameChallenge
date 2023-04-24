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
        let background = SKSpriteNode()
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

        animateBackground(background)
        addChild(background)

        showLife.position = CGPoint(x: 75, y: 775)
        showLife.size = CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/16)
        showLife.zPosition = 2
        addChild(showLife)

        showScore.position = CGPoint(x: 325, y: 765)
        showScore.text = "\(self.score)"
        showScore.zPosition = 2
        addChild(showScore)

        let sound = SKAudioNode(fileNamed: "The Sirens Battle.WAV")
        addChild(sound)
    }

    private func setupOverBackground() {
        let background = SKSpriteNode(imageNamed: "gameover")
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(background)

        let gameOverButton = SKSpriteNode(imageNamed: "jogarNovamente")
        gameOverButton.position = CGPoint(x: size.width/2, y: size.height/2.5)
        gameOverButton.size = CGSize(width: 236, height: 97)
        gameOverButton.name = "gameOver"
        addChild(gameOverButton)
        
        let backMenuButton = SKSpriteNode(imageNamed: "voltarMenu")
        backMenuButton.position = CGPoint(x: size.width/2, y: size.height/2)
        backMenuButton.size = CGSize(width: 236, height: 97)
        backMenuButton.name = "voltarMenu"
        addChild(backMenuButton)

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

        showScore.position = CGPoint(x: size.width/2, y: size.height/5.5)
        showScore.text = "Highest Score: \(UserDefaults.standard.integer(forKey: "highestScore"))"
        showScore.horizontalAlignmentMode = .center
        showScore.zPosition = 2
        addChild(showScore)
    }
}
