//
//  SessionManager.swift
//  SwvlNetworking
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2018 Swvl Inc. All rights reserved.
//

import Alamofire

extension SessionManager {
    /// Returns the request session task to allow cancelling the request
    @discardableResult
    func request<V>(_ request: Request<V>, completion: @escaping (Swift.Result<V, NetworkError>) -> Void) -> URLSessionTask? {
        
        let dataRequest = self.request(request).validate().responseJSON { response in
            
            var result: Swift.Result<V, NetworkError>
            switch response.result {
            case .success(let value):
                print("Server Response")
                print(value)
                print("==================================================")
                guard let data = response.data,
                    let parsedResponse = request.parse(data) else {
                        result = .failure(.cannotParseResponse)
                        return
                }
                result = .success(parsedResponse)
            case .failure:
                result = .failure(.server)
            }
            completion(result)
        }
        return dataRequest.task
    }
}
