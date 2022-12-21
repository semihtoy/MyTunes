//
//  BaseRequest.swift
//  STNetwork
//
//  Created by SEMİHT on 20.12.2022.
//

import Foundation
import Alamofire
import RxSwift

final class BaseRequest {
    static func request<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
          return Observable<T>.create { observer in
              let request = AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
                  switch response.result {
                  case .success(let value):
                      observer.onNext(value)
                      observer.onCompleted()
                  case .failure(let error):
                      observer.onError(error)
                      observer.onCompleted()
                  }
              }
              return Disposables.create {
                  request.cancel()
              }
          }
      }
}

