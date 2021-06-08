import SwiftUI

struct ContentView: View {

    // View-model is observed for changes to its state via SwiftUI
    @ObservedObject private var viewModel: CountryViewModel = CountryViewModel()

    var body: some View {
        NavigationView {
            CountriesListView(viewModel: viewModel)
                .navigationBarTitle(Text("Countries List"))
                .navigationBarItems(
                    leading: Button(
                        action: {
                            self.viewModel.updateCountriesList()
                    }
                    ) {
                        Text("Refresh")
                    },
                    trailing: Button(
                        action: {
                            withAnimation {
                                self.viewModel.toggleSortOrder()
                            }
                    }
                    ) {
                        if viewModel.isSortedAscending {
                            Text("Sort Z - A")
                        } else {
                            Text("Sort A - Z")
                        }
                    }
            )
            CountryDetailView()
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
            .alert(isPresented: $viewModel.apiErrorResponse.showAlert) {
                Alert(title: Text("Error"),
                      message: Text(viewModel.apiErrorResponse.error?.localizedDescription ?? "An error has occured. Please try again later."))
        }
    }
}

// MARK: - SwiftUI live previewing

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
