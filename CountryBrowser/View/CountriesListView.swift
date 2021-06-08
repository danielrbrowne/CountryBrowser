import SwiftUI

struct CountriesListView: View {

    // View-model is observed for changes to its state via SwiftUI
    @ObservedObject var viewModel: CountryViewModel

    var body: some View {
        List {
            ForEach(viewModel.countries) { country in
                NavigationLink(
                    destination: CountryDetailView(selectedCountry: country)
                ) {
                    Text(country.name)
                }
            }
        }.onAppear {
            // Initial update of list view
            // (i.e. don't refresh every time the user returns to the list)
            if self.viewModel.countries.count == 0 {
                self.viewModel.updateCountriesList()
            }
        }
    }
}
