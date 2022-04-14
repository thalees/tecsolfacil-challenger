defmodule Tecsolfacil.Infrastructure.CsvExporterJob do
  @moduledoc false
  use Oban.Worker, queue: :events, unique: [period: 60]

  alias Tecsolfacil.Infrastructure.AddressService

  @info_fields [:bairro, :cep, :ddd, :ibge, :localidade, :logradouro, :uf]

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{}}) do
    fields = [:logradouro, :cep, :bairro, :localidade, :uf, :ibge, :ddd]
    records = AddressService.list_addresses()

    print_file = csv_content(records, fields)

    {:ok, file} = File.open("addresses.csv", [:write])
    IO.binwrite(file, print_file)
    File.close(file)
  end

  defp csv_content(records, fields) do
    records
    |> Enum.map(fn record -> get_values(record, fields) end)
    |> then(fn x -> [@info_fields | x] end)
    |> CSV.encode()
    |> Enum.to_list()
    |> to_string()
  end

  defp get_values(record, fields) do
    record
    |> Map.from_struct()
    |> Map.take([])
    |> Map.merge(Map.take(record, fields))
    |> Map.values()
  end
end
