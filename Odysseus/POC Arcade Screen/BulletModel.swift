import Foundation

struct Bullet: Equatable {
    let id: String?
    let name: String?

    static func == (_ obj1: Bullet, _ obj2: Bullet) -> Bool {
        if obj1.id != obj2.id || obj1.name != obj2.name { return false }
        return true
    }
}
