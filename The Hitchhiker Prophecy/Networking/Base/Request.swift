//
//  Request.swift
//  SwvlNetworking
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2018 Swvl Inc. All rights reserved.
//

import Alamofire

typealias Parameters = [String: Any]
typealias JSON = [String: Any]
typealias ArrayOfJSON = [JSON]
typealias Headers = [String: String]


struct Request<Output> {
    let url: URL
    let method: HTTPMethod
    let params: Parameters?
    var headers: Headers?
    let parse: (Data) -> Output?

    init(url: URL,
         method: HTTPMethod = .get,
         params: Parameters? = nil,
         headers: Headers? = nil,
         parse: @escaping (Data) -> Output?) {
        self.url = url
        self.method = method
        self.params = params
        self.headers = headers
        self.parse = parse
    }
    
    private var defaultHeaders: HTTPHeaders {
        return SessionManager.defaultHTTPHeaders
    }
}

extension Request: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        defaultHeaders.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
        
        if let headers = headers {
            headers.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
        }
        
        if method == .get {
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
            return urlRequest
        }

        return urlRequest
    }
}
