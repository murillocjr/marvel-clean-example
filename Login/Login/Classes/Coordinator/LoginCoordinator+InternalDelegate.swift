//
//  LoginCoordinator+InternalDelegate.swift
//  Login
//
//  Created by Jorge Murillo on 5/31/21.
//

extension LoginCoordinator: LoginViewControllerInternalDelegateProtocol {
    public func LoginViewControllerDidAskForTutorial() {
        let tutorialViewController = LoginViewFactory.getTutorialScreen(internalDelegate: self)
        router.present(tutorialViewController, animated: true)
    }
}

extension LoginCoordinator: TutorialViewControllerInternalDelegateProtocol {
    func tutorialDidTapBack(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}
