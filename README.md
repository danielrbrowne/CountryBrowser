# CountryBrowser

An example of a SwiftUI app that presents a list of countries, each of which can be tapped on to see some country details.

## Features

- Country details fetched from an API endpoint, which is then presented in a list view
- A country details view is presented if the user taps on a particular country in the list view
- The country list can be sorted in ascending or descending alphabetical order (this happens client-side)
- A basic unit test covering decoding a mock of some valid JSON from the API into relevant model objects

## NOTES

- Uses my own library [APIota](https://github.com/danielrbrowne/APIota) for the API client functionality.

