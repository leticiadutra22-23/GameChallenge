import Foundation
import SpriteKit

struct Background {
    var backgroundAtlas: SKTextureAtlas
    let backgroundFrames: [SKTexture]

    init() {
        self.backgroundAtlas = SKTextureAtlas(named: "Backgrounds")
        self.backgroundFrames = [backgroundAtlas.textureNamed("background1"),
                              backgroundAtlas.textureNamed("background2"),
                              backgroundAtlas.textureNamed("background3")]
    }
}
