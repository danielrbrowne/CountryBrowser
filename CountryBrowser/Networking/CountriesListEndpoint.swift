import APIota
import Foundation

struct CountriesListEndpoint: APIotaCodableEndpoint {
    typealias SuccessResponse = [Country]
    typealias ErrorResponse = Data
    typealias Body = Data

    let encoder = JSONEncoder()

    let headers: HTTPHeaders? = nil

    let httpBody: Data? = nil

    let httpMethod: HTTPMethod = .GET

    let path = "/rest/v2/all"

    let queryItems: [URLQueryItem]? = nil
}
