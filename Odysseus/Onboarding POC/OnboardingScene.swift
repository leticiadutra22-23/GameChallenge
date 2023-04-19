import Foundation
import SpriteKit

class OnboardingScene: SKScene {
    
    var gameScene: GameStartScene {
        let scene = GameStartScene()
        scene.size = CGSize(width: 390, height: 844)
        scene.scaleMode = .aspectFit
        return scene
    }
    
    var currentPageIndex = 0
    
    let page1Node = SKSpriteNode(imageNamed: "onboarding1")
    let page2Node = SKSpriteNode(imageNamed: "onboarding2")
    let page3Node = SKSpriteNode(imageNamed: "onboarding3")
    
    override func didMove(to view: SKView) {
        addPage(page1Node)
    }
    
    func addPage(_ pageNode: SKSpriteNode) {
        addChild(pageNode)
        pageNode.position = CGPoint(x: frame.midX, y: frame.midY)
        
        let nextButton = SKSpriteNode(imageNamed: "pular")
        addChild(nextButton)
        nextButton.position = CGPoint(x: frame.maxX - 60, y: frame.maxY - 100)
        nextButton.name = "nextButton"
  
    }
    
    func removeCurrentPage() {
        switch currentPageIndex {
        case 0:
            page1Node.removeFromParent()
        case 1:
            page2Node.removeFromParent()
        case 2:
            page3Node.removeFromParent()
        default:
            break
        }
    }
    
    func showPage(_ pageIndex: Int) {
        removeCurrentPage()
        
        switch pageIndex {
        case 0:
            addPage(page1Node)
        case 1:
            addPage(page2Node)
        case 2:
            addPage(page3Node)
        default:
            break
        }
        
        currentPageIndex = pageIndex
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            if touchedNode.name == "nextButton" {
                if currentPageIndex < 2 {
                    showPage(currentPageIndex + 1)
                } else {
                    // onboarding completed, navigate to next screen
                    self.view?.presentScene(self.gameScene)
                    
                }
            }
        }
    }
}
