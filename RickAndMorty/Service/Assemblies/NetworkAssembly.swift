import Swinject
import SwinjectAutoregistration

class NetworkAssembly: Assembly {

    func assemble(container: Container) {
        container.autoregister(APIServiceProtocol.self,
                               initializer: APIService.init).inObjectScope(.container)
        container.autoregister(APIClientProtocol.self,
                               initializer: APIClient.init).inObjectScope(.container)
    }
}
