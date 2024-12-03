import RxSwift
import Foundation


protocol APIServiceProtocol {
    
    func request<T: Decodable>(target: TargetType) -> Single<T>
}

class APIService: APIServiceProtocol {
    
    // MARK: - APIServiceProtocol
    
    func request<T: Decodable>(target: TargetType) -> Single<T> {
        return Single.create { single in
            do {
                let urlRequest = try target.createURLRequest()
                
                let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                    if let error = error {
                        single(.failure(error))
                        return
                    }
                    
                    guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                        single(.failure(APIServiceError.responseError))
                        return
                    }
                    
                    guard let data = data else {
                        single(.failure(APIServiceError.unknownError))
                        return
                    }
                    
                    do {
                        let decodedObject = try JSONDecoder().decode(T.self, from: data)
                        single(.success(decodedObject))
                    } catch {
                        single(.failure(APIServiceError.decodingError))
                    }
                }
                
                task.resume()
                
                return Disposables.create {
                    task.cancel()
                }
            } catch {
                single(.failure(error))
                return Disposables.create()
            }
        }
    }
}
