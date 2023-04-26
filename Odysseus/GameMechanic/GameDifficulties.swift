import Foundation
import SpriteKit

extension GameScene {
    func checkScore() {
        switch self.score {
        case 250:
            self.enemyDuration = 2.3
            self.enemySpawnTime = 0.65
            
        case 500:
            self.enemyDuration = 2.1
            self.enemySpawnTime = 0.60

        case 750:
            self.view?.isPaused = true
            self.view?.presentScene(self.nextLevelScene)
            self.enemyDuration = 1.9
            self.enemySpawnTime = 0.55

        case 1000:
            self.enemyDuration = 1.7
            self.enemySpawnTime = 0.5

        case 1250:
            self.view?.isPaused = true
            self.view?.presentScene(self.finalBatleScene)
            self.enemyDuration = 1.5
            self.enemySpawnTime = 0.45
            self.shootingDelay = 0.2

        case 1500:
            self.enemyDuration = 1.3
            self.enemySpawnTime = 0.4
            self.shootingDelay = 0.15
            
        case 10000:
            self.view?.isPaused = true
            self.view?.presentScene(self.winnerScene)

        default:
            break
        }
    }
}
