import SwiftUI
import SpriteKit

struct ContentView: View {

    var scene: OnboardingScene {
        let scene = OnboardingScene()
        scene.size = CGSize(width: 390, height: 844)
        scene.scaleMode = .fill
        return scene
    }

    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .navigationBarBackButtonHidden()
    }
}
