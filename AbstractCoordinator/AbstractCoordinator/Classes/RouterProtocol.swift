//
//  RouterProtocol.swift
//  AbstractCoordinator
//
//  Created by Jorge Murillo on 5/30/21.
//

public protocol RouterProtocol: class {
  func present(_ viewController: UIViewController,
                animated: Bool)
  func present(_ viewController: UIViewController,
               animated: Bool,
               onDismissed: (()->Void)?)
  func dismiss(animated: Bool)
}

extension RouterProtocol {
    
  public func present(_ viewController: UIViewController,
                      animated: Bool) {
    present(viewController,
            animated: animated,
            onDismissed: nil)
  }
    
}

