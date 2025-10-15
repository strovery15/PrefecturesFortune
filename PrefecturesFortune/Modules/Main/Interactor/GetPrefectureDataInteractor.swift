

import Foundation

protocol GetPrefectureDataUseCase {
    func execute(parameter: UserData, completion: @escaping ((Result<PrefectureData, Never>) -> ()))
}

class GetPrefectureDataInteractor: GetPrefectureDataUseCase {
    func execute(parameter: UserData, completion: @escaping ((Result<PrefectureData, Never>) -> ())) {
        print("come")
        let baseURL = "https://yumemi-ios-junior-engineer-codecheck.app.swift.cloud"
        let endPoint = "/my_fortune"
        let apiVersion = "v1"
        
        let apiURL = baseURL + endPoint
        guard let url = URL(string: apiURL) else { return }
        
        var userData: Data?
        do {
            userData = try JSONEncoder().encode(parameter)
        } catch {
            print("encode-error")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(apiVersion, forHTTPHeaderField: "API-Version")
        request.httpBody = userData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
            }
            
            if let response = response as? HTTPURLResponse {
                print("statusCode\(response.statusCode)")
            }
            
            if let data = data {
                let prefectureData: PrefectureData
                do  {
                    prefectureData = try JSONDecoder().decode(PrefectureData.self, from: data)
                    completion(.success(prefectureData))
                } catch {
                    print("decode-error")
                }
            }
        }
        task.resume()
        
    }
    
}
