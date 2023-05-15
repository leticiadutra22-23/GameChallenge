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
        } else if name == "level2" {
          setupNextLevelBackground()
            return false
        } else if name == "finalBatle"{
            setupFinalBatleBackground()
            return false
        }else if name == "winner" {
            setupWinner()
            return false
        }else {
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

        showScore.position = CGPoint(x: 315, y: 765)
        showScore.text = "Acc: \(self.accuracy)%"
        showScore.zPosition = 2
        addChild(showScore)

        showScore2.position = CGPoint(x: 305, y: 725)
        showScore2.text = "Score: \(self.score)"
        showScore2.zPosition = 2
        addChild(showScore2)

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
    
    private func setupNextLevelBackground() {
        let background = SKSpriteNode(imageNamed: "level2")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        addChild(background)
        
        let nextLevel = SKSpriteNode(imageNamed: "proximoNivel")
        nextLevel.position = CGPoint(x: size.width/2, y: size.height/3.5)
        nextLevel.size = CGSize(width: 236, height: 97)
        nextLevel.name = "nextLevel"
        addChild(nextLevel)
        
        self.view?.isPaused = true
        
    }
    
    private func setupFinalBatleBackground() {
        let background = SKSpriteNode(imageNamed: "finalBatle")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        addChild(background)
        
        let nextLevel = SKSpriteNode(imageNamed: "proximoNivel")
        nextLevel.position = CGPoint(x: size.width/2, y: size.height/3.5)
        nextLevel.size = CGSize(width: 236, height: 97)
        nextLevel.name = "finalBatle"
        addChild(nextLevel)
    }
    
    private func setupWinner() {
        let background = SKSpriteNode(imageNamed: "vitoria")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        addChild(background)
        
        let backMenuButton = SKSpriteNode(imageNamed: "voltarMenu")
        backMenuButton.position = CGPoint(x: size.width/2, y: size.height/3.5)
        backMenuButton.size = CGSize(width: 236, height: 97)
        backMenuButton.name = "voltarMenu"
        addChild(backMenuButton)
    }
}
