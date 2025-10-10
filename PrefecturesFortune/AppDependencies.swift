

import Foundation
import UIKit

class AppDependencies {
    
    func assembleMainModule() -> UIViewController {
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? MainViewController else {
            fatalError()
        }
        let router = MainRouter(view: viewController)
        viewController.presenter = MainPresenter(view: viewController, dependency: .init(router: router, getFortuneData: GetFortuneDataInteractor()))
        return viewController
    }
    
//    func assembleDataInputView() -> UIViewController {
//        
//    }
}
