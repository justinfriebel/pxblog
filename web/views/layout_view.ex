defmodule Pxblog.LayoutView do
  use Pxblog.Web, :view
  use Timex

  def current_user(conn) do
    Plug.Conn.get_session(conn, :current_user)
  end

  def timestamp do
    Date.local.year
  end
end
