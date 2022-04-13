defmodule TecsolfacilWeb.UserControllerTest do
  use TecsolfacilWeb.ConnCase

  @create_attrs %{
    email: "foo@bar.com",
    password: "some password_hash",
    password_confirmation: "some password_hash"
  }
  @invalid_attrs %{email: nil, password_hash: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @create_attrs)
      assert %{"jwt" => jwt} = json_response(conn, 200)
      Regex.match?(~r/(^[\w-]*\.[\w-]*\.[\w-]*$)/, jwt)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end
