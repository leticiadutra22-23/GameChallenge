import SwiftUI
import SpriteKit

struct ContentView: View {

    var scene: GameSceneColide {
        let scene =  GameSceneColide(size: CGSize(width: 750, height: 1134))
        scene.scaleMode = .resizeFill
        scene.setScale(0.64)
        return scene
    }

    var body: some View {

        SpriteView(scene: scene)
            .ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}
