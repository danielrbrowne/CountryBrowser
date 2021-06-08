import APIota
import Foundation

struct CountriesAPIClient: APIotaClient {
    let session = URLSession.shared

    let decoder = JSONDecoder()

    var baseUrlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "restcountries.eu"

        return components
    }
}
