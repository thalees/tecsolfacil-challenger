defmodule TecsolfacilWeb.AddressView do
  use TecsolfacilWeb, :view
  alias TecsolfacilWeb.AddressView

  def render("show.json", %{address: address}) do
    %{data: render_one(address, AddressView, "address.json")}
  end

  def render("address.json", %{address: address}) do
    %{
      id: address.id,
      logradouro: address.logradouro,
      cep: address.cep,
      bairro: address.bairro,
      localidade: address.localidade,
      uf: address.uf,
      ibge: address.ibge,
      ddd: address.ddd
    }
  end
end
