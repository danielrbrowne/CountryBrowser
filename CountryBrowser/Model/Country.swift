import Foundation

/// A information record for a country.
struct Country: Decodable, Identifiable {

    /// A set of GPS coordinates.
    struct Location: Decodable {
        let latitude: Double
        let longitude: Double

        // Custom Decodable conformance (for decoding [Double] -> `Location`)

        init(from decoder: Decoder) throws {
            var container = try decoder.unkeyedContainer()
            var lat: Double = 0.0
            var long: Double = 0.0
            do {
                lat = try container.decode(Double.self)
                long = try container.decode(Double.self)
            } catch let error as DecodingError {
                switch error {
                case .valueNotFound(_, _):
                    // If there's no lat / long values - treat as incomplete data without failure
                    break
                default:
                    throw error
                }
            }

            self.latitude = lat
            self.longitude = long
        }

        init(latitude: Double, longitude: Double) {
            self.latitude = latitude
            self.longitude = longitude
        }
    }

    // `Identifiable` conformance for SwiftUI `ForEach()` usage
    let id = UUID()

    // Basic information properties
    // (omitting parsing of much of the JSON response as outside of scope for exercise)
    let capital: String
    let name: String
    let location: Location
    let population: UInt

    // `CodingKeys` implementation (accounts for `latlng` -> `location` naming).
    enum CodingKeys: String, CodingKey {
        case capital
        case name
        case location = "latlng"
        case population
    }
}
