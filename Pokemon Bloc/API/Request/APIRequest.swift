//
//  APIRequest.swift
//  APIRequest
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation

protocol APIRequest {
    
    associatedtype Response: Decodable
    
    var backend: Backend { get }
    var path: String { get }
    var parameters: [String: Encodable] { get }
    var method: APIMethod { get }
    var parameterEncoding: APIParameterEncoding { get }
}

extension APIRequest {
    
    var parameters: [String: Any] { [:] }
    var method: APIMethod { .get }
    var parameterEncoding: APIParameterEncoding { method.defaultParameterEncoding }
}

private extension APIMethod {
    
    var defaultParameterEncoding: APIParameterEncoding {
        switch self {
        case .get:
            return .url
        case .post:
            return .json
        case .put:
            return .json
        }
    }
}
