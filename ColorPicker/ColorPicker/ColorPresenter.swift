import SwiftUI

protocol ColorPresenterProtocol: ObservableObject {
    var colors: [ColorEntity] { get }
    func selectColor(_ color: ColorEntity)
}

class ColorPresenter: ColorPresenterProtocol {
    @Published var colors: [ColorEntity] = []
    private let interactor: ColorInteractorProtocol
    private let router: ColorRouterProtocol
    
    init(interactor: ColorInteractorProtocol, router: ColorRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.colors = interactor.getAvailableColors()
    }
    
    func selectColor(_ color: ColorEntity) {
        router.navigateToPreview(color: color)
    }
}
