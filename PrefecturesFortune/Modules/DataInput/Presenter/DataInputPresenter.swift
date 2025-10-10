

import Foundation

protocol DataInputPresentation {
    
}

class DataInputPresenter {
    
    struct Dependency {
        
    }
    
    weak var view: DataInputView?
    let dependency: Dependency!
    
    init(view: DataInputView, dependency: Dependency) {
        self.view = view
        self.dependency = dependency
    }
}

extension DataInputPresenter: DataInputPresentation {
    
}
