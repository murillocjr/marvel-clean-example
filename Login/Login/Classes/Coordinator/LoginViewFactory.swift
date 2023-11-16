//
//  LoginViewFactory.swift
//  Login
//
//  Created by Jorge Murillo on 5/31/21.
//

class LoginViewFactory {
    static let frameworkBundle = Bundle(for: LoginViewFactory.self)
    static let internalBundle = Bundle.init(path: frameworkBundle.path(forResource: "MarvelLogin", ofType: "bundle")!)
    static let storyboard = UIStoryboard(name: "Login", bundle: internalBundle)
    
    class func getInitialLoginScreen(
        internalDelegate: LoginViewControllerInternalDelegateProtocol?,
        externalDelegate: LoginViewControllerExternalDelegateProtocol?,
        viewModel: LoginViewModelProtocol
    ) -> LoginViewController {

        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewControllerId") as! LoginViewController
        
        viewController.viewModel = viewModel
        viewController.internalDelegate = internalDelegate
        viewController.externalDelegate = externalDelegate
        
        return viewController
    }    
}

extension LoginViewFactory {
    
    class func getTutorialScreen(internalDelegate: TutorialViewControllerInternalDelegateProtocol?) -> UIViewController {
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "TutorialViewControllerId") as! TutorialViewController
        viewController.internalDelegate = internalDelegate
        
        return viewController
    }
}
