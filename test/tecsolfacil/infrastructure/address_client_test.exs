defmodule Tecsolfacil.Infrastructure.AddressClientTest do
  use ExUnit.Case

  alias Tecsolfacil.Infrastructure.AddressClient

  import Tesla.Mock

  describe "search_address_by_cep/1" do
    test "returns the information of a address successfully" do
      cep = "13165000"
      url = "https://viacep.com.br/ws/#{cep}/json"

      expected_body = %{
        "bairro" => "Some District",
        "cep" => cep,
        "complemento" => "",
        "ddd" => "11",
        "gia" => "4420",
        "ibge" => "3529401",
        "localidade" => "São Paulo",
        "logradouro" => "Rua",
        "siafi" => "6689",
        "uf" => "SP"
      }

      mock(fn
        %{method: :get, url: ^url} ->
          %Tesla.Env{status: 200, body: expected_body}
      end)

      {:ok, response} = AddressClient.search_address_by_cep(cep)

      assert response == expected_body
    end

    test "address not found" do
      cep = "nonexistent_user"
      url = "https://viacep.com.br/ws/#{cep}/json"
      not_found_response = %{"message" => "Not Found"}

      mock(fn
        %{method: :get, url: ^url} ->
          %Tesla.Env{status: 404, body: not_found_response}
      end)

      response = AddressClient.search_address_by_cep(cep)

      assert {:error, not_found_response} == response
    end

    test "returns an error when http client throws an internal server error" do
      cep = "user"
      url = "https://viacep.com.br/ws/#{cep}/json"

      mock(fn
        %{method: :get, url: ^url} ->
          {:error, :timeout}
      end)

      assert {:error, :timeout} = AddressClient.search_address_by_cep(cep)
    end
  end
end
