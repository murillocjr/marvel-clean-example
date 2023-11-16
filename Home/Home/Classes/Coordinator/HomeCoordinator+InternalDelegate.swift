//
//  HomeCoordinator+InternalDelegate.swift
//  Home
//
//  Created by Jorge Murillo on 5/31/21.
//

extension HomeCoordinator: HomeViewControllerInternalDelegateProtocol {
    public func HomeViewControllerDidTapBack(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}
