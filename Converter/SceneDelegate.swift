//
//  SceneDelegate.swift
//  Converter
//
//  Created by admin on 06.03.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let contentView = ContentView()
        
        if let windowScene = scene as? UIWindowScene {
            
            
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            
            
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
