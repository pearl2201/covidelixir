defmodule CovidElixir do
  @moduledoc """
  A Module consumes an API provided by @NovelCOVID (Github) for tracking the global coronavirus (COVID-19, SARS-CoV-2) outbreak.
  """
  alias CovidElixir.Models.{GlobalData, ContinentData, CountryData, CountryInfo}
  @base_disease_url "https://disease.sh/v2"

  @doc ~S"""
  Return global stats: cases, deaths, recovered, time last updated, and active cases. Data is updated every 10 minutes.

  ## Examples

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
  """
  def get_global_data() do

    case HTTPoison.get("#{@base_disease_url}/all") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        temp = Poison.decode!(body)

        {:ok,
         %GlobalData{
           updated: DateTime.from_unix!(temp["updated"], 1000),
           cases: temp["cases"],
           today_cases: temp["todayCases"],
           deaths: temp["deaths"],
           today_deaths: temp["todayDeaths"],
           recovered: temp["recovered"],
           today_recovered: temp["todayRecovered"],
           active: temp["active"],
           critical: temp["critical"],
           population: temp["population"],
           tests: temp["tests"],
           affected_countries: temp["affectedCountries"]
         }}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "Not found :("}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, Kernel.inspect(reason)}
    end
  end

  @doc ~S"""
  Return All Continents Totals for Actual and Yesterday Data.
  ## Examples

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
  """
  def get_continents_data() do

    case HTTPoison.get("#{@base_disease_url}/continents") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        temp = Poison.decode!(body)

        {:ok,
         Enum.map(temp, fn x ->
           %ContinentData{
             updated: DateTime.from_unix!(x["updated"], 1000),
             cases: x["cases"],
             today_cases: x["todayCases"],
             deaths: x["deaths"],
             today_deaths: x["todayDeaths"],
             recovered: x["recovered"],
             today_recovered: x["todayRecovered"],
             active: x["active"],
             critical: x["critical"],
             population: x["population"],
             tests: x["tests"],
             countries: x["countries"],
             continent_name: x["continent"]
           }
         end)}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "Not found :("}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, Kernel.inspect(reason)}
    end
  end

  @doc ~S"""
  Return a Specific Continent Totals for Actual and Yesterday Data.

  ## Examples

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
  """
  def get_data_by_continent(continent) when is_binary(continent) do

    case HTTPoison.get("#{@base_disease_url}/continents/#{continent}") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        temp = Poison.decode!(body)

        {:ok,
         %ContinentData{
           updated: DateTime.from_unix!(temp["updated"], 1000),
           cases: temp["cases"],
           today_cases: temp["todayCases"],
           deaths: temp["deaths"],
           today_deaths: temp["todayDeaths"],
           recovered: temp["recovered"],
           today_recovered: temp["todayRecovered"],
           active: temp["active"],
           critical: temp["critical"],
           population: temp["population"],
           tests: temp["tests"],
           countries: temp["countries"],
           continent_name: temp["continent"]
         }}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "Not found :("}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, Kernel.inspect(reason)}
    end
  end

  @doc ~S"""
  Return All Countries Totals for Actual and Yesterday Data.

  ## Examples

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
  """
  def get_countries_data() do

    case HTTPoison.get("#{@base_disease_url}/countries") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        temp = Poison.decode!(body)

        {:ok,
         Enum.map(temp, fn x ->
           %CountryData{
             updated: DateTime.from_unix!(x["updated"], 1000),
             country_name: x["country"],
             country_info: %CountryInfo{
               iso2: x["countryInfo"]["iso2"],
               iso3: x["countryInfo"]["iso3"],
               latitude: x["countryInfo"]["lat"],
               longitude: x["countryInfo"]["long"],
               flag_url: x["countryInfo"]["flag"]
             },
             cases: x["cases"],
             today_cases: x["todayCases"],
             deaths: x["deaths"],
             today_deaths: x["todayDeaths"],
             recovered: x["recovered"],
             today_recovered: x["todayRecovered"],
             active: x["active"],
             critical: x["critical"],
             population: x["population"],
             tests: x["tests"],
             continent: x["continent"]
           }
         end)}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "Not found :("}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, Kernel.inspect(reason)}
    end
  end

  @doc ~S"""
  Return a Specific Country's Totals for Actual and Yesterday Data.

  ## Examples

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
  """
  def get_data_by_country(country) when is_binary(country) do

    case HTTPoison.get("#{@base_disease_url}/countries/#{country}") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        temp = Poison.decode!(body)

        {:ok,
         %CountryData{
           updated: DateTime.from_unix!(temp["updated"], 1000),
           country_name: temp["country"],
           country_info: %CountryInfo{
             iso2: temp["countryInfo"]["iso2"],
             iso3: temp["countryInfo"]["iso3"],
             latitude: temp["countryInfo"]["lat"],
             longitude: temp["countryInfo"]["long"],
             flag_url: temp["countryInfo"]["flag"]
           },
           cases: temp["cases"],
           today_cases: temp["todayCases"],
           deaths: temp["deaths"],
           today_deaths: temp["todayDeaths"],
           recovered: temp["recovered"],
           today_recovered: temp["todayRecovered"],
           active: temp["active"],
           critical: temp["critical"],
           population: temp["population"],
           tests: temp["tests"],
           continent: temp["continent"]
         }}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "Not found :("}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, Kernel.inspect(reason)}
    end
  end
end
