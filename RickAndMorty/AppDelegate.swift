import UIKit
import RxFlow
import Swinject
import SwinjectAutoregistration

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    public lazy var window: UIWindow? = {
        let window = UIWindow()
        window.makeKeyAndVisible()
        return window
    }()

    private var assembler: Assembler!

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Configure dependencies and flows
        configureDependencies()
        configureFlow()
        return true
    }

    // MARK: - Dependency Injection
    func configureDependencies() {
        assembler = Assembler(AppServiceAssemblies.serviceAssemblies)
    }

    // MARK: - Flow Configuration
    func configureFlow() {
        let appStepper = assembler.resolver ~> AppStepper.self
        let appFlow = assembler.resolver ~> AppFlow.self
        let coordinator = assembler.resolver ~> FlowCoordinator.self

        coordinator.coordinate(flow: appFlow, with: appStepper)

        Flows.use(appFlow, when: .created) { [unowned self] root in
            self.window?.rootViewController = root
            self.window?.makeKeyAndVisible()
        }
    }
}
