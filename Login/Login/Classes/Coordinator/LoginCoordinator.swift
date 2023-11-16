//
//  LoginCoordinator.swift
//  Login
//
//  Created by Jorge Murillo on 5/28/21.
//

import AbstractCoordinator

public class LoginCoordinator: CoordinatorProtocol {
    
    public var children: [CoordinatorProtocol] = []
    public let router: RouterProtocol
    
    public var loginViewControllerDelegate: LoginViewControllerExternalDelegateProtocol?

    public init(router: RouterProtocol) {
      self.router = router
    }

    public func present(animated: Bool,
                        onDismissed: (() -> Void)?) {
        
        let userRemoteDataSource = UserRemoteDataSource()
        let remoteUserRepository = RemoteMarvelUserRepository(dataSource: userRemoteDataSource)
        let loginUseCase = MainLoginUseCase(marvelUserRepository: remoteUserRepository)
        let loginViewModel = LoginViewModel(useCase: loginUseCase)
        
        let viewController = LoginViewFactory.getInitialLoginScreen(
            internalDelegate: self,
            externalDelegate: self.loginViewControllerDelegate,
            viewModel: loginViewModel)
        
        loginViewModel.delegate = viewController
        
        router.present(viewController,
                       animated: animated,
                       onDismissed: onDismissed)
        }
}
