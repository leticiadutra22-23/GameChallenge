import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        SpriteKitContainer(scene: GameScene())
            .ignoresSafeArea()
    }
}
