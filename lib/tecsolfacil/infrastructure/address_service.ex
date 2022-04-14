defmodule Tecsolfacil.Infrastructure.AddressService do
  @moduledoc """
  The Address Service.
  """

  import Ecto.Query, warn: false
  alias Tecsolfacil.Domain.Address
  alias Tecsolfacil.Infrastructure.CsvExporterJob
  alias Tecsolfacil.Repo

  def list_addresses do
    Repo.all(Address)
  end

  def get_address(cep), do: Repo.get_by(Address, cep: cep)

  def create_address(attrs \\ %{}) do
    %Address{}
    |> Address.changeset(attrs)
    |> Repo.insert()
  end

  def call_oban(%{}) do
    %{}
    |> CsvExporterJob.new()
    |> Oban.insert()
  end
end
