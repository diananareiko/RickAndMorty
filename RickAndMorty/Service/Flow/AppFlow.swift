import UIKit
import RxFlow
import Swinject
import SwinjectAutoregistration

class AppFlow: Flow {
    
    var root: Presentable {
        return rootViewController
    }
    
    private let rootViewController = UINavigationController()
    
    private let resolver: Resolver
    private let appStepper: AppStepper
    
    init(resolver: Resolver) {
        self.resolver = resolver
        self.appStepper = resolver ~> AppStepper.self
    }
    
    func navigate(to step: any RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? AppStep else {
            return .none
        }
        switch step {
        case .charactersAreRequired:
            return navigateToCharactersListScreen()
        }
    }
    
    private func navigateToCharactersListScreen() -> FlowContributors {
        let (viewController, stepper) = resolver.resolve((CharactersViewController, Stepper).self)!
        
        self.rootViewController.setViewControllers([viewController], animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: stepper))
    }

}
