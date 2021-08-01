//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by Admin on 07/07/2021.
//

import Foundation
class SignupWebService{
    private var urlString: String
    private var urlSession: URLSession
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm fromModel : SignupFormRequestModel, completion: @escaping (Result<SignupResponseModel,SignupError>) -> Void){
        
        guard  let url = URL(string: urlString) else {
            completion(.failure(SignupError.invalidRequestURLString))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(fromModel)
        
        let task = urlSession.dataTask(with: request){ (data, response, error) in
            
            if let requestError = error {
                completion(.failure(SignupError.failedRequest(description: requestError.localizedDescription)))
                return
            }
            
            if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data){
                completion(.success(signupResponseModel))
            }else{
                completion(.failure(SignupError.invalidResponseModel))
            }
        }
        task.resume()

    }
}
