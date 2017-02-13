defmodule MailEx.PageController do
  use MailEx.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
