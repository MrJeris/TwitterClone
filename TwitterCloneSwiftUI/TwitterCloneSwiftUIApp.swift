//
//  TwitterCloneSwiftUIApp.swift
//  TwitterCloneSwiftUI
//
//  Created by MrJeris on 29.03.2023.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneSwiftUIApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoginView()
            }
        }
    }
}
