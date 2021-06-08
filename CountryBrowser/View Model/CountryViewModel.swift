import APIota
import Combine
import Foundation

class CountryViewModel: ObservableObject {

    // MARK: - Published properties

    @Published var countries: [Country] = []
    @Published var isSortedAscending = true
    @Published var apiErrorResponse: (showAlert: Bool, error: Error?) = (false, nil)

    // MARK: - Private properties

    private var apiClient: APIotaClient
    private var cancellable: AnyCancellable?

    // MARK: - Initialization

    init(apiClient: APIotaClient = CountriesAPIClient()) {
        self.apiClient = apiClient
    }

    // MARK: - Public methods

    /// Updates the list of countries from the REST API.
    func updateCountriesList() {

        // First, remove existing list items
        countries.removeAll()

        // Reset sort order
        isSortedAscending = true

        // Send the API request for the countries info list
        // (Chaining error handling and property assignment)
        cancellable = apiClient.sendRequest(for: CountriesListEndpoint())
            .catch { [weak self] error -> AnyPublisher<[Country], Never> in
                guard let self = self else {
                    return Just([]).eraseToAnyPublisher()
                }
                self.apiErrorResponse = (true, error)

                return Just([]).eraseToAnyPublisher()
            }
            .assign(to: \.countries, on: self)
    }

    /// Toggles the country list sort order between ascending and descending.
    func toggleSortOrder() {

        isSortedAscending.toggle()
        countries = countries.sorted {
            if isSortedAscending {
                return $0.name < $1.name
            } else {
                return $0.name > $1.name
            }
        }
    }
}
