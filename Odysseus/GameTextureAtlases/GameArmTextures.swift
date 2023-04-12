import Foundation
import SpriteKit

struct Arm {
    var armAtlas: SKTextureAtlas
    let armFrames: [SKTexture]
    
    init() {
        self.armAtlas = SKTextureAtlas(named: "Arms")
        self.armFrames = [armAtlas.textureNamed("canhao1"),
                          armAtlas.textureNamed("canhao2"),
                          armAtlas.textureNamed("canhao3"),
                          armAtlas.textureNamed("canhao4"),
                          armAtlas.textureNamed("canhao5"),
                          armAtlas.textureNamed("canhao6"),
                          armAtlas.textureNamed("canhao7"),
                          armAtlas.textureNamed("canhao8"),
                          armAtlas.textureNamed("canhao9"),
                          armAtlas.textureNamed("canhao1")]
    }
}
