//
//  SearchUseCase.swift
//  STNetwork
//
//  Created by SEMİHT on 20.12.2022.
//

import Foundation
import RxSwift
import STEntities

public protocol SearchUseCase {
    func getSearchList(params: [String : Any]) -> Observable<SearchListResponse>
}

extension SearchUseCase {
    func getSearchList(params: [String : Any]) -> Observable<SearchListResponse> {
        return BaseRequest.request(SearchEndPoints.list(params: params))
    }
}
