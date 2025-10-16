

import Foundation
import UIKit

protocol MainWireFrame {
    
    func presentDataInputView()
}

class MainRouter: MainWireFrame {
    
    weak var mainViewController: UIViewController?
    
    init(view: UIViewController) {
        self.mainViewController = view
    }
    
    func presentDataInputView() {
        let appDependencies = AppDependencies()
        let viewController = appDependencies.assembleDataInputModule()
        mainViewController?.navigationController?.present(viewController, animated: true)
    }
}
