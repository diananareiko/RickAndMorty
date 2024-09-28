import RxSwift

protocol APIClientProtocol {
    
    func getCharacter(id: Int) -> Single<Character>
    func getCharacters(page: Int?) -> Single<[Character]>
    func getLocation(id: Int) -> Single<Location>
    
}

class APIClient: APIClientProtocol {

    private var apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }

    // MARK: - APIClientProtocol
    
    func getCharacter(id: Int) -> Single<Character> {
        let target = RickAndMortyAPI.getCharacter(id: id)
        return apiService.request(target: target)
    }
    
    func getCharacters(page: Int?) -> Single<[Character]> {
        let target = RickAndMortyAPI.getAllCharacters(page: page)
        return apiService.request(target: target)
            .map { (response: CharactersResponse) in
                return response.results
            }
    }
    
    func getLocation(id: Int) -> Single<Location> {
        let target = RickAndMortyAPI.getLocation(id: id)
        return apiService.request(target: target)
    }
}
