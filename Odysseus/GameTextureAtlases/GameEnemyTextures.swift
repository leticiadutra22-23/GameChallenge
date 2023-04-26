import Foundation
import SpriteKit

struct Enemy {
    var enemyAtlas: SKTextureAtlas
    let enemyFrames: [SKTexture]
    
    init() {
        self.enemyAtlas = SKTextureAtlas(named: "Enemy")
        self.enemyFrames = [enemyAtlas.textureNamed("enemy1"),
                            enemyAtlas.textureNamed("enemy2"),
                            enemyAtlas.textureNamed("enemy3")]
    }
}

struct Enemy2 {
    var enemyAtlas: SKTextureAtlas
    let enemyFrames: [SKTexture]

    init() {
        self.enemyAtlas = SKTextureAtlas(named: "Enemy")
        self.enemyFrames = [enemyAtlas.textureNamed("lanca"),
                            enemyAtlas.textureNamed("lanca")]
    }
}

