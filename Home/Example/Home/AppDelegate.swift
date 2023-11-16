//
//  AppDelegate.swift
//  Home
//
//  Created by Jorge Murillo on 05/31/2021.
//  Copyright 2021 BCP. All rights reserved.
//

import UIKit
import AbstractCoordinator
import Home

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var exampleMockCoordinator: ExampleMockCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let uiNavigationController = UINavigationController(nibName: nil, bundle: Bundle(for: AppDelegate.self))
        let exampleRouter = ExampleMockRouter(navigationController: uiNavigationController)
        
        exampleMockCoordinator = ExampleMockCoordinator(router: exampleRouter)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = uiNavigationController
        window?.makeKeyAndVisible()

        exampleMockCoordinator?.present(animated: true, onDismissed: nil)
        
        return true
    }
}
