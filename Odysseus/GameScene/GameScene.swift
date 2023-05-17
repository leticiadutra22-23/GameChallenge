import Foundation
import SpriteKit
import SwiftUI


class GameScene: SKScene {

    var spawnProjectiles: [SKSpriteNode] = []
    var spawnLanes: [Double] = [100, 200, 300]
    var showScore: SKLabelNode = SKLabelNode(fontNamed: "LLPixel")
    var showScore2: SKLabelNode = SKLabelNode(fontNamed: "LLPixel")
    var accuracy: Int = 0 {
        didSet {
                showScore.text = "E: \(accuracy)"
        }
    }
//    var accList: [Int] = [] {
//        didSet {
//            if accList.count > 20 {
//                accList.remove(at: 0)
//                accuracy = accList.filter({$0 > 0}).count
//            }
//        }
//    }
    var score: Int = 0 {
        didSet {
            showScore2.text = "A: \(score)"
        }
    }
    var life: Int = 3 {
        didSet {
            if life == 2 {
                self.showLife.texture = SKTexture(imageNamed: "life2")
            }
            if life == 1 {
                self.showLife.texture = SKTexture(imageNamed: "life1")
            }
        }
    }
    var impactGenerator: UIImpactFeedbackGenerator?
    var showLife: SKSpriteNode = SKSpriteNode(imageNamed: "life3")
    var isShooting: Double = 1
    var refire: Double = 1
    var shootingDelay: Double = 0.3
    var enemyDuration: Double = 0.5
    var enemySpawnTime: Double = 0.2 {
        didSet {
            resetupEnemy()
        }
    }
    var final: Bool = false
    var ulisses: SKSpriteNode = SKSpriteNode()
    var arms: [SKSpriteNode] = []

    var gameOverScene: GameScene {
        let scene = GameScene(score: score)
        scene.name = "over"
        scene.size = CGSize(width: 390, height: 844)
        scene.scaleMode = .fill
        return scene
    }
    var gameStartScene: GameScene {
        let scene = GameScene(score: score)
        scene.name = "start"
        scene.size = CGSize(width: 390, height: 844)
        scene.scaleMode = .fill
        return scene
    }

    var gameScene: GameScene {
        let scene = GameScene(score: score)
        scene.name = "game"
        scene.size = CGSize(width: 390, height: 844)
        scene.scaleMode = .fill
        return scene
    }

    var nextLevelScene: GameScene {
        let scene = GameScene(score: score)
        scene.name = "level2"
        scene.size = CGSize(width: 390, height: 844)
        scene.scaleMode = .fill
        return scene
    }

    var finalBatleScene: GameScene {
        let scene = GameScene(score: score)
        scene.name = "finalBatle"
        scene.size = CGSize(width: 390, height: 844)
        scene.scaleMode = .fill
        return scene
    }

    var winnerScene: GameScene {
        let scene = GameScene(score: score)
        scene.name = "winner"
        scene.size = CGSize(width: 390, height: 844)
        scene.scaleMode = .fill
        return scene
    }

    // MARK: AI-related variables.
    var randomPosition: Double = 0
    let learningRate: Double = 0.001
    let bias: Double = -1.0
    var weights1: [Double] = [0.0, 0.0]
    var weights2: [Double] = [0.0, 0.0]
    // --------------------------

    init(score: Int) {
            self.score = score
            super.init(size: CGSize(width: 390, height: 844))
        }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func didMove(to view: SKView) {

        let defaults = UserDefaults.standard
        let aiCompleted = defaults.bool(forKey: "firstTimeTraining")

        if aiCompleted {
            self.weights1[0] = defaults.double(forKey: "weight10")
            self.weights1[1] = defaults.double(forKey: "weight11")
            self.weights2[0] = defaults.double(forKey: "weight20")
            self.weights2[1] = defaults.double(forKey: "weight21")
            print("Loaded")
        } else {
            self.weights1 = [-0.2, 1.8]
            self.weights2 = [0.2, -0.6]
            print("Started")
            defaults.set(true, forKey: "firstTimeTraining")
        }

        if setupBackground(self.name) {
            self.ulisses = setupUlisses()
            self.arms = setupArm()
            setupEnemy()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.name == "game" {
//            gameTouch(touches)
            self.name = "start"
            let value = accuracy+score
            print(value)
            let stackedValue = Int((score*100)/value)
            print(stackedValue)
            UserDefaults.standard.set(stackedValue, forKey: "highestScore")
//            if highestScore() { // remove later to update gameOver Scene.
//                print(UserDefaults.standard.integer(forKey: "lastScore"))
//                print(UserDefaults.standard.integer(forKey: "highestScore"))
//            }
            self.score = 0
            self.accuracy = 0
            saveSetupWeights()
            self.view?.presentScene(gameStartScene, transition: SKTransition.fade(withDuration: 0.5))
        } else {
            guard let touch = touches.first else { return }
            let touchLocation = touch.location(in: self)
            offGametouchedButton(touchLocation, "startButton")
            offGametouchedButton(touchLocation, "gameOver")
            offGametouchedButton(touchLocation, "voltarMenu")
            offGametouchedButton(touchLocation, "nextLevel")
            offGametouchedButton(touchLocation, "finalBatle")
        }
    }

    override func update(_ currentTime: TimeInterval) {
        if self.name == "game" {
            for projectile in spawnProjectiles {
                projectileMovement(projectile)
            }
        }
    }

    override func didEvaluateActions() {
        if self.name == "game" {
            checkCollision()
            checkUlissesCollision()
        }
    }
}
