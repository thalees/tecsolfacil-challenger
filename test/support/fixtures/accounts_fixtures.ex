defmodule Tecsolfacil.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tecsolfacil.Accounts` context.
  """

  @doc """
  Generate a unique user email.
  """
  def unique_user_email, do: "some email#{System.unique_integer([:positive])}@foo.com"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: unique_user_email(),
        password_hash: "some password_hash",
        password: "somepassword",
        password_confirmation: "somepassword"
      })
      |> Tecsolfacil.Accounts.create_user()

    user
  end
end
