import UIKit
import RxFlow

protocol Module {
    associatedtype View
    associatedtype Router
}

protocol PresentableView: UIViewController {
    associatedtype View
}

struct AnyModule<View, Router>: Module {

    let view: UIViewController
    let router: Stepper

    init<View: PresentableView>(view: View, stepper: Stepper) where View.View == Self.View {
        self.view = view
        self.router = stepper
    }
}
