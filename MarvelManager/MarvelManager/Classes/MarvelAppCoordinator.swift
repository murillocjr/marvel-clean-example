//
//  MarvelAppCoordinator.swift
//  Core
//
//  Created by Jorge Murillo on 5/31/21.
//

import AbstractCoordinator
import Login
import Home

public class MarvelAppCoordinator: CoordinatorProtocol {

    public var children: [CoordinatorProtocol] = []
    public let router: RouterProtocol
    
    public init(router: RouterProtocol) {
        self.router = router
    }
    
    public init(navigationController: UINavigationController) {
        self.router = MarvelAppRouter(navigationController: navigationController)
    }

    public func present(animated: Bool,
                      onDismissed: (() -> Void)?) {
        let loginCoordinator = LoginCoordinator(router: self.router)
        loginCoordinator.loginViewControllerDelegate = self
        self.presentChild(loginCoordinator, animated: true)
    }
}

extension MarvelAppCoordinator: LoginViewControllerExternalDelegateProtocol {
    public func LoginViewControllerDidSuccessLogin() {
        ///Navigate to Home
        print("Navigate to Home")
        let homeCoordinator = HomeCoordinator(router: self.router)
        self.presentChild(homeCoordinator, animated: true)
    }
}
