

import Foundation

protocol GetFortuneDataUseCase {
    func execute(parameter: String, completion: ((Result<String, Never>) -> ()))
}

class GetFortuneDataInteractor: GetFortuneDataUseCase {
    
    func execute(parameter: String, completion: ((Result<String, Never>) -> ())) {
        completion(.success(parameter))
    }
}
