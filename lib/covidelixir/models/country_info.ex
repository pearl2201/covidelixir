defmodule CovidElixir.Models.CountryInfo do
  defstruct [
    :iso2,
    :iso3,
    :latitude,
    :longitude,
    :flag_url]

  @type t :: %__MODULE__{
          iso2: String.t(),
          iso3: String.t(),
          latitude: Float.t(),
          longitude: Float.t(),
          flag_url: String.t()
        }
end
