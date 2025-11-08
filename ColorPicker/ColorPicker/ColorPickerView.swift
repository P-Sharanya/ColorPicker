import SwiftUI

struct ColorPickerView: View {
    @ObservedObject var presenter: ColorPresenter
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Pick a Color")
                .font(.title)
            
            ForEach(presenter.colors, id: \.name) { colorItem in
                Button(colorItem.name) {
                    presenter.selectColor(colorItem)
                }
                .frame(width: 200, height: 50)
                .background(colorItem.color)
                .foregroundColor(.white)
                .cornerRadius(12)
            }
        }
        .padding()
    }
}

struct ColorPreviewView: View {
    let color: ColorEntity
    
    var body: some View {
        ZStack {
            color.color.ignoresSafeArea()
            Text(color.name)
                .font(.largeTitle)
                .foregroundColor(.white)
                .bold()
        }
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        // Mock dependencies for preview
        let interactor = ColorInteractor()
        let mockRouter = MockColorRouter()
        let presenter = ColorPresenter(interactor: interactor, router: mockRouter)
        
        return ColorPickerView(presenter: presenter)
    }
}

// A simple mock router that does nothing (for preview only)
class MockColorRouter: ColorRouterProtocol {
    func navigateToPreview(color: ColorEntity) {
        // No navigation in preview mode
    }
}
