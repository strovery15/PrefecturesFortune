

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
    
    func assembleDataInputModule() -> UIViewController {
        guard let viewController = UIStoryboard(name: "DataInput", bundle: nil).instantiateInitialViewController() as? DataInputViewController else {
            fatalError()
        }
        viewController.presenter = DataInputPresenter(view: viewController, dependency: .init())
        return viewController
    }
    
}

extension Notification.Name {
    static let notifyName = Notification.Name("notifyName")
    static let notifyBirthday = Notification.Name("notifyBirthday")
    static let notifyBloodtype = Notification.Name("notifyBloodtype")
}
