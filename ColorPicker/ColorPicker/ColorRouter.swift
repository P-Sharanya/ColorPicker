import UIKit
import SwiftUI

protocol ColorRouterProtocol {
    func navigateToPreview(color: ColorEntity)
}

class ColorRouter: ColorRouterProtocol {
    weak var navigationController: UINavigationController?
    
    func navigateToPreview(color: ColorEntity) {
        let previewView = ColorPreviewView(color: color)
        let hostingController = UIHostingController(rootView: previewView)
        navigationController?.pushViewController(hostingController, animated: true)
    }
    
    static func createModule() -> UIViewController {
        let router = ColorRouter()
        let interactor = ColorInteractor()
        let presenter = ColorPresenter(interactor: interactor, router: router)
        
        let view = ColorPickerView(presenter: presenter)
        let hostingController = UIHostingController(rootView: view)
        
        let navController = UINavigationController(rootViewController: hostingController)
        router.navigationController = navController
        
        return navController
    }
}

