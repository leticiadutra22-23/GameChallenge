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

struct FlamesProjectile {
    var flamesProjectileAtlas: SKTextureAtlas
    let flamesProjectileFrames: [SKTexture]
    
    init() {
        self.flamesProjectileAtlas = SKTextureAtlas(named: "Projectiles")
        
        self.flamesProjectileFrames = [flamesProjectileAtlas.textureNamed("bullet3"),
                                       flamesProjectileAtlas.textureNamed("bullet4"),
                                       flamesProjectileAtlas.textureNamed("bullet3")]
    }
}
