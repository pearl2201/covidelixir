# Covidelixir

This is a Elixir wrapper library around the API provided by @NovelCovid https://github.com/NovelCovid/API for tracking the global coronavirus (COVID-19, SARS-CoV-2) outbreak.

It provides up-to-date data about Coronavirus outbreak includes confirmed cases, recovered, deaths, active, today cases, today deaths, tests and more.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `covidelixir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:covidelixir, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/covidelixir](https://hexdocs.pm/covidelixir).

## Usage
- Gets global stats. Data is updated every 10 minutes.
```elixir
    iex> CovidElixir.get_global_data
    {:ok,
      %CovidElixir.Models.GlobalData{
        active: 6100280,
        affected_countries: 215,
        cases: 18975254,
        critical: 65543,
        deaths: 711220,
        population: 7765601299,
        recovered: 12163754,
        tests: 354197632,
        today_cases: 9775,
        today_deaths: 933,
        today_recovered: 7367,
        updated: ~U[2020-08-06 03:12:31.438Z]
      }}
```
- Gets All Continent's Totals
```elixir
    iex> CovidElixir.get_continents_data
    {:ok,
    [
      %CovidElixir.Models.ContinentData{
        active: 2513523,
        cases: 5849457,
        continent_name: "North America",
        countries: ["Anguilla", "Antigua and Barbuda", "Aruba", "Bahamas",
          "Barbados", "Belize", "Bermuda", "British Virgin Islands", "Canada",
          "Caribbean Netherlands", "Cayman Islands", "Costa Rica", "Cuba",
          "Cura├ºao", "Dominica", "Dominican Republic", "El Salvador", "Greenland",
          "Grenada", "Guadeloupe", "Guatemala", "Haiti", "Honduras", "Jamaica",
          "Martinique", "Mexico", "Montserrat", "Nicaragua", "Panama",
          "Saint Kitts and Nevis", "Saint Lucia", "Saint Martin",
          "Saint Pierre Miquelon", "Saint Vincent and the Grenadines",
          "Sint Maarten", "St. Barth", "Trinidad and Tobago",
          "Turks and Caicos Islands", "USA"],
        critical: 25783,
        deaths: 227714,
        population: 589551798,
        recovered: 3108220,
        tests: 69340451,
        today_cases: 6959,
        today_deaths: 852,
        today_recovered: 4650,
        updated: ~U[2020-08-06 03:22:31.547Z]
      },
      ...
    ]}
  ```
- Gets a Specific Continent Totals.
```elixir
    iex> CovidElixir.get_data_by_continent("asia")
    {:ok,
    %CovidElixir.Models.ContinentData{
      active: 1070243,
      cases: 4685932,
      continent_name: "Asia",
      countries: ["Afghanistan", "Armenia", "Azerbaijan", "Bahrain", "Bangladesh",
        "Bhutan", "Brunei", "Cambodia", "China", "Cyprus", "Georgia", "Hong Kong",
        "India", "Indonesia", "Iran", "Iraq", "Israel", "Japan", "Jordan",
        "Kazakhstan", "Kuwait", "Kyrgyzstan", "Lao People's Democratic Republic",
        "Lebanon", "Macao", "Malaysia", "Maldives", "Mongolia", "Myanmar", "Nepal",
        "Oman", "Pakistan", "Palestine", "Philippines", "Qatar", "S. Korea",
        "Saudi Arabia", "Singapore", "Sri Lanka", "Syrian Arab Republic", "Taiwan",
        "Tajikistan", "Thailand", "Timor-Leste", ...],
      critical: 18879,
      deaths: 103855,
      population: 4612888321,
      recovered: 3511834,
      tests: 154556030,
      today_cases: 80,
      today_deaths: 1,
      today_recovered: 105,
      updated: ~U[2020-08-06 03:22:31.549Z]
    }}
```
  > Continent name: "Asia", "North America", "South America", Europe", "Africa", "Australia/Oceania"
- Gets all Countries Totals
```elixir
    iex> CovidElixir.get_countries_data
    {:ok,
    [%CovidElixir.Models.CountryData{
      active: 9793,
      cases: 36829,
      continent: "Asia",
      country_info: %CovidElixir.Models.CountryInfo{
        flag_url: "https://disease.sh/assets/img/flags/af.png",
        iso2: "AF",
        iso3: "AFG",
        latitude: 33,
        longitude: 65
      },
      country_name: "Afghanistan",
      critical: 31,
      deaths: 1294,
      population: 39007045,
      recovered: 25742,
      tests: 89822,
      today_cases: 0,
      today_deaths: 0,
      today_recovered: 0,
      updated: ~U[2020-08-06 03:22:30.865Z]
    },
    ...
    ]}
  ```
- Get a Specific Country's Totals for Actual
```elixir
    iex> CovidElixir.get_countries_data
    {:ok,
    %CovidElixir.Models.CountryData{
      active: 9793,
      cases: 36829,
      continent: "Asia",
      country_info: %CovidElixir.Models.CountryInfo{
        flag_url: "https://disease.sh/assets/img/flags/af.png",
        iso2: "AF",
        iso3: "AFG",
        latitude: 33,
        longitude: 65
      },
      country_name: "Afghanistan",
      critical: 31,
      deaths: 1294,
      population: 39007045,
      recovered: 25742,
      tests: 89822,
      today_cases: 0,
      today_deaths: 0,
      today_recovered: 0,
      updated: ~U[2020-08-06 03:22:30.865Z]
    }}
  ```
  > Country name example: "Italy"

