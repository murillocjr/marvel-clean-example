import CoreEntities
import AbstractCoordinator
import MarvelCore

protocol LoginViewModelDelegateProtocol: class {
    func loginEvent(state: ViewControllerState)
}

protocol LoginViewModelProtocol {
    var delegate: LoginViewModelDelegateProtocol? { get set }
    func requestLogin(username: String, password: String)
}

final class LoginViewModel: LoginViewModelProtocol {
    var useCase: LoginUseCaseProtocol
    weak var delegate: LoginViewModelDelegateProtocol?
    
    init(useCase: LoginUseCaseProtocol) {
        self.useCase = useCase
    }

    func requestLogin(username: String, password: String) {
        delegate?.loginEvent(state: .loading)
        useCase.execute(requestValue: LoginUseCaseRequestValue(username: username,
                                                               password: password),
                        completion: { [weak self] result in
                            switch result {
                                case .success(let response):
                                    let jsonData = try! JSONEncoder().encode(response)
                                    let jsonString = String(data: jsonData, encoding: .utf8)!
                                    UserDefaults.standard.set(jsonString, forKey: "MarvelUserKey")

                                    self?.delegate?.loginEvent(state: .success)
                                case .failure(let error):
                                    print(error.localizedDescription)
                                    self?.delegate?.loginEvent(state: .error)
                            }
                        })
    }
}
