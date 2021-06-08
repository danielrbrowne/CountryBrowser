import SwiftUI

struct CountryDetailView: View {
    var selectedCountry: Country?

    var body: some View {
        Group {
            // Country info detail view OR placeholder as a fallback
            if selectedCountry != nil {
                VStack {
                    Text(selectedCountry!.name)
                        .fontWeight(.bold)
                        .padding(.bottom, 20)
                    Text("Captial: \(selectedCountry!.capital)")
                        .padding(.bottom, 10)
                    Text("Population: \(selectedCountry!.population)")
                        .padding(.bottom, 10)
                    Text("Location: \(selectedCountry!.location.latitude), \(selectedCountry!.location.longitude)")
                }.navigationBarTitle(Text("Details"))
            } else {
                VStack {
                    Text("Country details will appear here…")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}
