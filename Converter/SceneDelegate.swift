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

    static var sceneDelegate: SceneDelegate!
    
    var window: UIWindow?
    private var responseResult = ResponseResult()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        Self.sceneDelegate = self
        
        //View
        let contentView = ContentView()
        //Hosting
        let contentHostingController = UIHostingController(rootView: contentView)

        self.responseResult.response()
  
        if let windowScene = scene as? UIWindowScene {
            
            
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = contentHostingController
            
            
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
