

import Foundation

protocol MainPresentation {
    func fortuneStart()
    func setData()
}

class MainPresenter {
    
    struct Dependency {
        //router
        let router: MainWireFrame
        
        //interactor
        let getFortuneData: GetFortuneDataUseCase
    }
    
    weak var view: MainView?
    let dependency: Dependency!
    
    init(view: MainView, dependency: Dependency) {
        self.view = view
        self.dependency = dependency
    }
}

extension MainPresenter: MainPresentation {
    
    func fortuneStart() {
        print("fortuneStart")
        dependency.getFortuneData.execute(parameter: "getFortuneData") { result in
            switch result {
            case .success(let string):
                print(string)
            }
        }
    }
    
    func setData() {
         print("setData")
        dependency.router.presentDataInputView()
    }
}
