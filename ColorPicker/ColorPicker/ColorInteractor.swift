import SwiftUI

protocol ColorInteractorProtocol {
    func getAvailableColors() -> [ColorEntity]
}

class ColorInteractor: ColorInteractorProtocol {
    func getAvailableColors() -> [ColorEntity] {
        return [
            ColorEntity(name: "Red", color: .red),
            ColorEntity(name: "Green", color: .green),
            ColorEntity(name: "Yellow", color: .yellow)
        ]
    }
}
