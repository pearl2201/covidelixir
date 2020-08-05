
defmodule CovidElixir.Models.ContinentData do
  defstruct [:updated,:cases,:today_cases,:deaths,:today_deaths,:recovered,:active,:critical,:continent_name,:population,:tests,:countries]

  @type t :: %__MODULE__{
    updated: DateTime.t,
    cases: Integer.t,
    today_cases: Integer.t,
    deaths: Integer.t,
    today_deaths: Integer.t,
    recovered: Integer.t,
    active: Interger.t,
    critical: Integer.t,
    continent_name: String.t,
    population: Integer.t,
    tests: Integer.t,
    countries: [String.t]
  }

end
