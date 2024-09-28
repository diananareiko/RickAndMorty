import RxCocoa
import RxFlow
import RxSwift

protocol AppStepper: Stepper {}

final class AppStepperImp {

    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

}

// MARK: - AppStepper
extension AppStepperImp: AppStepper {}

// MARK: - Stepper
extension AppStepperImp: Stepper {

    var initialStep: Step {
        return AppStep.charactersAreRequired
    }

    func readyToEmitSteps() {}
}
