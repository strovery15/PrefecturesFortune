

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
        print("presentDataInputView")
        let appDependencies = AppDependencies()
        let viewController = appDependencies.assembleDataInputModule()
        viewController.modalPresentationStyle = .fullScreen
        mainViewController?.navigationController?.present(viewController, animated: true)
    }
}
