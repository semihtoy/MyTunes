//
//  BaseApiConfiguration.swift
//  STNetwork
//
//  Created by SEMİHT on 20.12.2022.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
