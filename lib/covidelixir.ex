defmodule Covidelixir do
  @moduledoc """
  A Module consumes an API provided by @NovelCOVID (Github) for tracking the global coronavirus (COVID-19, SARS-CoV-2) outbreak.
  """

  @doc ~S"""
  Return global stats: cases, deaths, recovered, time last updated, and active cases. Data is updated every 10 minutes.
  """
  def get_global_data() do

    HTTPoison.start()

    case HTTPoison.get("") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok,}
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error,"Not found :("}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, Kernel.inspect(reason)}
    end
  end

  @doc ~S"""
  Return All Continents Totals for Actual and Yesterday Data.
  """
  def get_continents_data() do

  end

  @doc ~S"""
  Return a Specific Continent Totals for Actual and Yesterday Data.
  """
  def get_data_by_continent(continent) when is_binary(continent) do

  end

  @doc ~S"""
  Return All Countries Totals for Actual and Yesterday Data.
  """
  def get_countries_data() do

  end

  @doc ~S"""
  Return a Specific Country's Totals for Actual and Yesterday Data.s
  """
  def get_data_by_country(country) when is_binary(country) do

  end
end
