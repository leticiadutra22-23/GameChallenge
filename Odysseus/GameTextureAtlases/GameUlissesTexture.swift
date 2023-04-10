import Foundation
import SpriteKit

struct Ulisses {
    var ulissesAtlas: SKTextureAtlas
    let ulissesFrames: [SKTexture]

    init() {
        self.ulissesAtlas = SKTextureAtlas(named: "Ulisses")
        self.ulissesFrames = [ulissesAtlas.textureNamed("ulisses"),
                            ulissesAtlas.textureNamed("ulisses1"),
                            ulissesAtlas.textureNamed("ulisses")]
    }
}
