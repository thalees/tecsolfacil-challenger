defmodule Tecsolfacil.Infrastructure.AddressClient do
  @moduledoc """
  Responsible for searching for address information.
  """

  use Tesla, only: [:get]

  plug Tesla.Middleware.BaseUrl, "https://viacep.com.br/ws/"
  plug Tesla.Middleware.JSON

  def search_address_by_cep(cep) do
    get("#{cep}/json")
    |> handle_response()
  end

  defp handle_response({:ok, %{body: body, status: status}}) when status in 100..399,
    do: {:ok, body}

  defp handle_response({:ok, %{body: body, status: status}}) when status in 400..599,
    do: {:error, body}

  defp handle_response({:error, reason}), do: {:error, reason}
end
