////
////  ColorPickerApp.swift
////  ColorPicker
////
////  Created by next on 08/11/25.
////
//
//import SwiftUI
//
//@main
//struct ColorPickerApp: App {
//    var body: some Scene {
//        WindowGroup {
//
//            ContentView()
//        }
//    }
//}
import SwiftUI

@main
struct ColorPickerApp: App {
    var body: some Scene {
        WindowGroup {
            UIKitContainerViewController()
        }
    }
}

struct UIKitContainerViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return ColorRouter.createModule()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
