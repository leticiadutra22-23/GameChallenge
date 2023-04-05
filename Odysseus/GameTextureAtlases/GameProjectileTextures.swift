import Foundation
import SpriteKit

struct Projectile {
    var projectileAtlas: SKTextureAtlas
    let projectileFrames: [SKTexture]
    
    init() {
        self.projectileAtlas = SKTextureAtlas(named: "Projectiles")
        self.projectileFrames = [projectileAtlas.textureNamed("bullet"),
                                 projectileAtlas.textureNamed("bullet2"),
                                 projectileAtlas.textureNamed("bullet")]
    }
}
