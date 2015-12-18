defmodule Pxblog.PageController do
  use Pxblog.Web, :controller

  alias Pxblog.Post
  alias Pxblog.User

  def index(conn, _params) do
    users = Repo.all(User)
    posts = Repo.all(Post)
    render(conn, "index.html", users: users, posts: posts)
  end
end
