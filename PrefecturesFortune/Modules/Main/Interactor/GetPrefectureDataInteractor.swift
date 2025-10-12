

import Foundation

protocol GetPrefectureDataUseCase {
    func execute(parameter: String, completion: ((Result<String, Never>) -> ()))
}

class GetPrefectureDataInteractor: GetPrefectureDataUseCase {
    
    func execute(parameter: String, completion: ((Result<String, Never>) -> ())) {
        completion(.success(parameter))
    }
}
