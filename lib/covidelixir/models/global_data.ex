defmodule CovidElixir.Models.GlobalData do
  defstruct [
    :updated,
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
    :affected_countries
  ]

  @type t :: %__MODULE__{
          updated: DateTime.t(),
          cases: Integer.t(),
          today_cases: Integer.t(),
          deaths: Integer.t(),
          today_deaths: Integer.t(),
          recovered: Integer.t(),
          today_recovered: Integer.t(),
          active: Integer.t(),
          critical: Integer.t(),
          population: Integer.t(),
          tests: Integer.t(),
          affected_countries: Integer.t()
        }
end
