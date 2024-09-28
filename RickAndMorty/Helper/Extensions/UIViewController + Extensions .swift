import UIKit

extension UIViewController {
    
    static func instantiate<T: UIViewController>(fromStoryboard name: String, bundle: Bundle? = nil) -> T {
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        let identifier = String(describing: T.self)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("ViewController with identifier \(identifier) not found in \(name) storyboard")
        }
        
        return viewController
    }
}
