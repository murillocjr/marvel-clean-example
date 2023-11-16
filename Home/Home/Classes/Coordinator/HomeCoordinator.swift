//
//  HomeCoordinator.swift
//  Home
//
//  Created by Jorge Murillo on 5/28/21.
//

import AbstractCoordinator

public class HomeCoordinator: CoordinatorProtocol {
    
    public var children: [CoordinatorProtocol] = []
    public let router: RouterProtocol
    
    public init(router: RouterProtocol) {
      self.router = router
    }

    public func present(animated: Bool,
                        onDismissed: (() -> Void)?) {
        
        let comicsRemoteDataSource = ComicsRemoteDataSource()
        let comicsRepository = RemoteMarvelComicRepository(dataSource: comicsRemoteDataSource)
        let homeUseCase = MainHomeUseCase(marvelComicRepository: comicsRepository)
        let homeViewModel = HomeViewModel(useCase: homeUseCase)
        
        let viewController = HomeViewFactory.getInitialHomeScreen(internalDelegate: self, viewModel: homeViewModel)
        
        homeViewModel.delegate = viewController

        router.present(viewController,
                       animated: animated,
                       onDismissed: onDismissed)
        }
}
