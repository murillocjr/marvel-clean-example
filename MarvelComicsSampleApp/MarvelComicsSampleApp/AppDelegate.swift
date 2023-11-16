//
//  AppDelegate.swift
//  MarvelComicsSampleApp
//
//  Created by Jorge Murillo on 5/31/21.
//
import UIKit
import AbstractCoordinator
import MarvelManager

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: MarvelAppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let uiNavigationController = UINavigationController(nibName: nil, bundle: Bundle(for: AppDelegate.self))
        let appRouter = MarvelAppRouter(navigationController: uiNavigationController)
        
        appCoordinator = MarvelAppCoordinator(router: appRouter)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = uiNavigationController
        window?.makeKeyAndVisible()

        appCoordinator?.present(animated: true, onDismissed: nil)
        
        return true
    }
}

