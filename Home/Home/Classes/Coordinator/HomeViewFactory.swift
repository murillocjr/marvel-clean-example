//
//  HomeViewFactory.swift
//  Home
//
//  Created by Jorge Murillo on 5/31/21.
//

class HomeViewFactory {
    static let frameworkBundle = Bundle(for: HomeViewFactory.self)
    static let internalBundle = Bundle.init(path: frameworkBundle.path(forResource: "MarvelHome", ofType: "bundle")!)
    static let storyboard = UIStoryboard(name: "Home", bundle: internalBundle)

    class func getInitialHomeScreen(
        internalDelegate: HomeViewControllerInternalDelegateProtocol?,
        viewModel: HomeViewModelProtocol
    ) -> HomeViewController {

        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewControllerId") as! HomeViewController

        viewController.viewModel = viewModel
        viewController.internalDelegate = internalDelegate

        return viewController
    }
}
