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
