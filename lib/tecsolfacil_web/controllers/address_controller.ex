defmodule TecsolfacilWeb.AddressController do
  use TecsolfacilWeb, :controller

  alias Tecsolfacil.Domain.Address
  alias Tecsolfacil.Infrastructure.AddressClient
  alias Tecsolfacil.Infrastructure.AddressService

  action_fallback TecsolfacilWeb.FallbackController

  def download(conn, _params) do
    file = File.open!("addresses.csv", [:read, :binary])
    binary = IO.binread(file, :eof)

    conn
    # |> send_download({:file, "addresses.csv"})
    |> send_download({:binary, binary}, filename: "address.csv")
  end

  def show(conn, %{"cep" => cep}) do
    parsed_cep = cep |> String.split_at(5) |> then(fn {v1, v2} -> v1 <> "-" <> v2 end)

    address = AddressService.get_address(parsed_cep)

    case address do
      nil ->
        create(conn, %{"cep" => cep})

      address ->
        render(conn, "show.json", address: address)
    end
  end

  def create(conn, %{"cep" => cep}) do
    {:ok, address} = search_cep(cep)

    with {:ok, %Address{} = address} <- AddressService.create_address(address) do
      AddressService.call_oban(%{})

      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.address_path(conn, :show, address))
      |> render("show.json", address: address)
    end
  end

  defp search_cep(cep), do: AddressClient.search_address_by_cep(cep)
end
