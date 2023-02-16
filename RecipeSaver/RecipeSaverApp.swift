//
//  RecipeSaverApp.swift
//  RecipeSaver
//
//  Created by George Chang on 2023-02-15.
//

import SwiftUI

@main
struct RecipeSaverApp: App {
    @StateObject var recipesViewModel = RecipesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipesViewModel)
                .onAppear {
                UIApplication.shared.addTapGestureRecognizer()
           }
        }
    }
}

extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = (connectedScenes.first as? UIWindowScene)?.windows.first else { return }
           let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
           tapGesture.requiresExclusiveTouchType = false
           tapGesture.cancelsTouchesInView = false
           tapGesture.delegate = self
           window.addGestureRecognizer(tapGesture)
       }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true // set to `false` if you don't want to detect tap during other gestures
    }
}
