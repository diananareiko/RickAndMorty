import RxSwift
import RxCocoa

protocol CharactersViewModelType {
    var characters: Observable<[Character]> { get }
    func fetchCharacters(page: Int)
    func fetchNextPage()
}

class CharactersViewModel: CharactersViewModelType {
    let characters: Observable<[Character]>
    
    private let charactersRelay = BehaviorRelay<[Character]>(value: [])
    private let apiClient: APIClientProtocol
    private let disposeBag = DisposeBag()
    
    private var currentPage = 0
    private var isFetching = false

    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
        self.characters = charactersRelay.asObservable()
    }
    
    func fetchCharacters(page: Int) {
        apiClient.getCharacters(page: currentPage).subscribe { [weak self] characters in
            self?.charactersRelay.accept(characters)
        }.disposed(by: disposeBag)
    }
    
    func fetchNextPage() {
        fetchCharacters(page: currentPage)
    }
}
