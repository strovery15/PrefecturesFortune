

import Foundation

protocol DataInputPresentation {
    
    func addData(_ name: String,_ birthday: Date,_ bloodtype: String,_ today: Date)
}

class DataInputPresenter {
    
    struct Dependency {
        let createUserData: CreateUserDataUseCase
    }
    
    weak var view: DataInputView?
    let dependency: Dependency!
    
    init(view: DataInputView, dependency: Dependency) {
        self.view = view
        self.dependency = dependency
    }
}

extension DataInputPresenter: DataInputPresentation {
    
    func addData(_ name: String,_ birthday: Date,_ bloodtype: String,_ today: Date) {
        dependency.createUserData.execute(parameter1: name, parameter2: birthday, parameter3: bloodtype, parameter4: today) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let userData):
                view?.dataInput(userData)
            }
        }
    }
}
