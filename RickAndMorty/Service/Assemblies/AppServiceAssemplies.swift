import Foundation
import Swinject

enum AppServiceAssemblies {

    static var serviceAssemblies: [Assembly] {
        [CharactersAssembly(),
         NetworkAssembly(),
         FlowAssembly()]
    }
}
