defmodule Tecsolfacil.Guardian.AuthPipeline do
  @moduledoc false
  use Guardian.Plug.Pipeline,
    otp_app: :Tecsolfacil,
    module: Tecsolfacil.Guardian,
    error_handler: Tecsolfacil.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
