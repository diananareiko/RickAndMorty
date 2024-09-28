import RxFlow
import Swinject
import SwinjectAutoregistration

class FlowAssembly: Assembly {

    func assemble(container: Container) {
        container
            .autoregister(FlowCoordinator.self, initializer: FlowCoordinator.init)
            .inObjectScope(.container)
        container.autoregister(AppStepper.self, initializer: AppStepperImp.init)

        container.register(AppFlow.self) { (resolver) in
            AppFlow(resolver: resolver)
        }
    }
}
