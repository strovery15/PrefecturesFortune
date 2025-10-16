

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
        
        dependency.getPrefectureData.execute(parameter: userData) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let prefectureData):
                view?.showResultDataView(prefectureData)
            case .failure(let error):
                switch error {
                case .badurl:
                    print("error_badurl")
                    view?.showError()
                case .encode:
                    print("error_encode")
                    view?.showError()
                case .decode:
                    print("error_decode")
                    view?.showError()
                case .session:
                    print("error_session")
                    view?.showError()
                }
            }
        }
    }
    
    func setData() {
         print("setData")
        dependency.router.presentDataInputView()
    }
}
