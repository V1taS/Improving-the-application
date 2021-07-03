//
//  SceneDelegate.swift
//  Improving the application
//
//  Created by Vitalii Sosin on 26.06.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
//        FPSCounter.showInStatusBar(windowScene: scene)
        let window = UIWindow(windowScene: scene)
        configureMainVC(window)
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
       
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
       
    }

    private func configureMainVC(_ window: UIWindow) {
        let viewController = MainScreenConfigurator.createModule()
        window.overrideUserInterfaceStyle = .light
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        self.window = window
    }
}
