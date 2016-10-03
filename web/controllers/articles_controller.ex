defmodule BlogPress.ArticlesController do
  use BlogPress.Web, :controller

  def show(conn, %{"id" => id}) do
    render conn, "#{id}.json"
  end
end
