//
//  SearchEndPoints.swift
//  STNetwork
//
//  Created by SEMİHT on 20.12.2022.
//

import Foundation
import Alamofire

enum SearchEndPoints: APIConfiguration {
    case list(params: [String: Any])
    
    var method: HTTPMethod {
        switch self {
        case .list:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .list:
            return "search"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .list(let params):
            return params
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let urlString = Bundle.main.infoDictionary?["BaseURL"] as? String
        let url = try (urlString ?? "").asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        let encoding: ParameterEncoding = {
            switch method {
            case .post:
                return JSONEncoding.default
            default:
                return URLEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
        
    }
}
