defmodule CovidElixir.Models.CountryData do
  defstruct [
    :updated,
    :country_name,
    :country_info,
    :cases,
    :today_cases,
    :deaths,
    :today_deaths,
    :recovered,
    :today_recovered,
    :active,
    :critical,
    :population,
    :tests,
    :continent
  ]

  @type t :: %__MODULE__{
          updated: DateTime.t(),
          country_name: String.t(),
          country_info: CovidElixir.Models.CountryInfo.t(),
          cases: Integer.t(),
          today_cases: Integer.t(),
          deaths: Integer.t(),
          today_deaths: Integer.t(),
          recovered: Integer.t(),
          today_recovered: Integer.t(),
          active: Interger.t(),
          critical: Integer.t(),
          population: Integer.t(),
          tests: Integer.t(),
          continent: String.t()
        }
end
