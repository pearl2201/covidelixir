defmodule CovidElixirTest do
  use ExUnit.Case

  alias CovidElixir.Models.{GlobalData, ContinentData, CountryData}

  test "test_global_data" do
    assert {:ok, %GlobalData{}} = CovidElixir.get_global_data()
  end

  test "test_continents_data" do
    assert {:ok, _} = CovidElixir.get_continents_data()
    {signal, body} = CovidElixir.get_continents_data()
    assert signal == :ok
    assert body != nil
    assert %ContinentData{} = Enum.at(body, 0)
  end

  test "test_continent_data" do
    assert {:ok, %ContinentData{}} = CovidElixir.get_data_by_continent("asia")
  end

  test "test_countries_data" do
    assert {:ok, _} = CovidElixir.get_countries_data()
    {signal, body} = CovidElixir.get_countries_data()
    assert signal == :ok
    assert body != nil
    assert %CountryData{} = Enum.at(body, 0)
  end

  test "test_country_data" do
    assert {:ok, %CountryData{}} = CovidElixir.get_data_by_country("vn")
  end
end
