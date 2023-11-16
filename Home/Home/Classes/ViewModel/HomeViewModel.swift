import CoreEntities
import AbstractCoordinator
import MarvelCore

protocol HomeViewModelDelegateProtocol: class {
    var delegate: HomeViewModelDelegateProtocol? {get set}
    func homeEvent(state: ViewControllerState)
}

protocol HomeViewModelProtocol {
    var comics: [MarvelComic]? {get set}
    func requestList()
}

final class HomeViewModel: HomeViewModelProtocol {
    var useCase: HomeUseCaseProtocol
    var comics: [MarvelComic]?
    weak var delegate: HomeViewModelDelegateProtocol?

    init(useCase: HomeUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func requestList() {
        delegate?.homeEvent(state: .loading)
        useCase.execute(completion: { [weak self] result in
                            switch result {
                                case .success(let response):
                                    self?.comics = response
                                    self?.delegate?.homeEvent(state: .success)
                                case .failure(let error):
                                    print(error.localizedDescription)
                                    self?.delegate?.homeEvent(state: .error)
                            }
                        })
    }
}
