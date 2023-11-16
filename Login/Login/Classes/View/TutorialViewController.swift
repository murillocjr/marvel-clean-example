//
//  TutorialViewController.swift
//  Login
//
//  Created by Jorge Murillo on 5/31/21.
//

import Foundation

class TutorialViewController: UIViewController{
    public var internalDelegate: TutorialViewControllerInternalDelegateProtocol?
    @IBAction func tapBack(_ sender: Any) {
        internalDelegate?.tutorialDidTapBack(viewController: self)
    }
}
