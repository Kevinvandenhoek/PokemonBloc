//
//  APIService.swift
//  APIService
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation

protocol API {
    
    func request<Request: APIRequest>(_ apiRequest: Request) async -> Result<Request.Response, APIError>
}

enum APIError: Error {
    case general
    case urlError(Error)
    case decodingError
    case invalidRequest
    case statusCode(Int)
}

// MARK: Service
struct APIService: API {
    
    let decoder: JSONDecoder
    
    func request<Request: APIRequest>(_ request: Request) async -> Result<Request.Response, APIError> {
        return await withCheckedContinuation { continuation in
            execute(request: request) { result in
                continuation.resume(returning: result)
            }
        }
    }
}

private extension APIService {
    
    func execute<Request: APIRequest>(request: Request, completion: @escaping (Result<Request.Response, APIError>) -> Void) {
        guard let urlRequest = urlRequest(from: request) else { return completion(.failure(.invalidRequest)) }
        print("🐛 request: \(urlRequest)")
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(.urlError(error)))
            } else if let data = data {
                do {
                    switch request.backend {
                    case .pokeApi:
                        let data = try decoder.decode(Request.Response.self, from: data)
                        completion(.success(data))
                    }
                } catch {
                    let response = String(decoding: data, as: UTF8.self)
                    print("failed to decode \(response), request was \(urlRequest.url?.absoluteString ?? "")")
                    completion(.failure(.decodingError))
                }
            } else if let response = response as? HTTPURLResponse {
                completion(.failure(.statusCode(response.statusCode)))
            } else {
                completion(.failure(.general))
            }
        }
        return task.resume()
    }
}

// MARK: Factory
private extension APIService {
    
    func httpMethod(from method: APIMethod) -> String {
        switch method {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        }
    }
    
    func urlRequest<Request: APIRequest>(from apiRequest: Request) -> URLRequest? {
        guard let url = URL(string: "\(baseUrl(for: apiRequest.backend).absoluteString)/\(apiRequest.path)") else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod(from: apiRequest.method)
        request.cachePolicy = .reloadIgnoringLocalCacheData
        setParameters(on: &request, for: apiRequest)
        setHeaders(on: &request, for: apiRequest)
        return request
    }
    
    private func setHeaders<Request: APIRequest>(on request: inout URLRequest, for apiRequest: Request) {
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        switch apiRequest.backend {
        case .pokeApi:
            break
        }
    }
    
    private func setParameters<Request: APIRequest>(on request: inout URLRequest, for apiRequest: Request) {
        switch apiRequest.parameterEncoding {
        case .json:
            request.httpBody = try? JSONSerialization.data(withJSONObject: apiRequest.parameters, options: [.fragmentsAllowed])
        case .url:
            guard var url = request.url?.absoluteString else { return }
            url += apiRequest.parameters.percentEncoded
            request.url = URL(string: url)
        }
    }
    
    private func baseUrl(for backend: Backend) -> URL {
        switch backend {
        case .pokeApi:
            return URL(string: "https://www.pokeapi.co/api/v2")!
        }
    }
}

private extension Dictionary {
    
    var percentEncoded: String {
        let parameters = map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        guard !parameters.isEmpty else { return "" }
        return "?\(parameters)"
    }
}

private extension CharacterSet {
    
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
