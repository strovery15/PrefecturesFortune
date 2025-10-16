

import Foundation

enum GettingError: Error {
    case badurl
    case encode
    case decode
    case session
}

protocol GetPrefectureDataUseCase {
    func execute(parameter: UserData, completion: @escaping ((Result<PrefectureData, GettingError>) -> ()))
}

class GetPrefectureDataInteractor: GetPrefectureDataUseCase {
    func execute(parameter: UserData, completion: @escaping ((Result<PrefectureData, GettingError>) -> ())) {
        
        let baseURL = "https://yumemi-ios-junior-engineer-codecheck.app.swift.cloud"
        let endPoint = "/my_fortune"
        let apiVersion = "v1"
        
        let apiURL = baseURL + endPoint
        guard let url = URL(string: apiURL) else {
            completion(.failure(.badurl))
            return
        }
        
        var userData: Data?
        do {
            userData = try JSONEncoder().encode(parameter)
        } catch {
            completion(.failure(GettingError.encode))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(apiVersion, forHTTPHeaderField: "API-Version")
        request.httpBody = userData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error != nil {
                completion(.failure(.session))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode < 200 && response.statusCode >= 300 {
                    completion(.failure(.session))
                    return
                }
            }
            
            if let data = data {
                let prefectureData: PrefectureData
                do  {
                    prefectureData = try JSONDecoder().decode(PrefectureData.self, from: data)
                    completion(.success(prefectureData))
                    return
                } catch {
                    completion(.failure(.session))
                    return
                }
            }
        }
        task.resume()
        
    }
    
}
