defmodule Pxblog.PageController do
  use Pxblog.Web, :controller

  alias Pxblog.Post
  alias Pxblog.User

  def index(conn, _params) do
    user = User |> Repo.get!(2) |> Repo.preload [:posts]
    render(conn, "index.html", user: user)
  end
end
