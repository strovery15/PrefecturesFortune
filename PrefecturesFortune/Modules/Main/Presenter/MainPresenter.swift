

import Foundation

protocol MainPresentation {
    func fortuneStart(_ userData: UserData)
    func setData()
}

class MainPresenter {
    
    struct Dependency {
        //router
        let router: MainWireFrame
        
        //interactor
        let getPrefectureData: GetPrefectureDataUseCase
    }
    
    weak var view: MainView?
    let dependency: Dependency!
    
    init(view: MainView, dependency: Dependency) {
        self.view = view
        self.dependency = dependency
    }
}

extension MainPresenter: MainPresentation {
    
    func fortuneStart(_ userData: UserData) {
        print("fortuneStart")
        dependency.getPrefectureData.execute(parameter: "getFortuneData") { result in
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
