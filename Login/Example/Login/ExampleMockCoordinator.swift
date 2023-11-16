//
//  ExampleMockCoordinator.swift
//  Login_Example
//
//  Created by Jorge Murillo on 5/30/21.
//  Copyright 2021 BCP. All rights reserved.
//

import AbstractCoordinator
import Login

public class ExampleMockCoordinator: CoordinatorProtocol {

    public var children: [CoordinatorProtocol] = []
    public let router: RouterProtocol
    
    public init(router: RouterProtocol) {
        self.router = router
      }

      public func present(animated: Bool,
                          onDismissed: (() -> Void)?) {
        let loginCoordinator = LoginCoordinator(router: self.router)
        loginCoordinator.loginViewControllerDelegate = self
        self.presentChild(loginCoordinator, animated: true)
      }
}

extension ExampleMockCoordinator: LoginViewControllerExternalDelegateProtocol {
    public func LoginViewControllerDidSuccessLogin() {
        ///Navigate to Home
        print("Navigate to Home")
    }
}
