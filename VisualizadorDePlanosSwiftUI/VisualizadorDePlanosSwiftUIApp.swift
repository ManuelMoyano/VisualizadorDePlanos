//
//  VisualizadorDePlanosSwiftUIApp.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 07/07/2022.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct VisualizadorDePlanosSwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            if let _ = authenticationViewModel.user {
                OptionsView(authenticationViewModel: authenticationViewModel)
            } else {
                InitView(authenticationViewModel: authenticationViewModel)
            }
        }
    }
}
