import UIKit
import Swinject
import RxFlow

final class CharactersAssembly: Assembly {
    func assemble(container: Container) {
        // Register CharactersViewController
        container.autoregister(CharactersViewModelType.self, initializer: CharactersViewModel.init)
        .inObjectScope(.transient)
        container.register(CharactersViewController.self) { resolver in
            let viewController: CharactersViewController = UIViewController.instantiate(fromStoryboard: "CharactersViewController")
            viewController.viewModel = resolver.resolve(CharactersViewModelType.self)
            return viewController
        }
        .inObjectScope(.transient)

        container.register((CharactersViewController, Stepper).self) { resolver in
            guard let viewController = resolver.resolve(CharactersViewController.self) else {
                fatalError("Failed to resolve CharactersViewController")
            }
            return (viewController, viewController)
        }
    }
}
