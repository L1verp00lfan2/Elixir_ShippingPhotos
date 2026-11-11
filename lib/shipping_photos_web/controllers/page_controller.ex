
  defmodule ShippingPhotosWeb.PageController do
  use ShippingPhotosWeb, :controller

  #Home Page
  def home(conn, _params) do
    render(conn, :home)
  end

  #About Page
def about(conn, _params) do
  render(conn, :about,
    app_name: "Shipping Photos",
    version: "1.0"
  )
end

#Job Details Page

# the next three lines are commentary abouit the function signature of the job function.
#It takes a Plug.Conn struct and a map of parameters, and returns a Plug.Conn struct.
# Plug.Conn.t()  # receives a connection
# map()          # receives parameters
# Plug.Conn.t()  # returns a connection

@spec job(Plug.Conn.t(), map()) :: Plug.Conn.t()
def job(conn, %{"id" => id}) do
  render(conn, :job, id: id)
end

#Photo Details Page

def photo(conn, %{"id" => id, "photo" => photo}) do
  render(conn, :photo,
    id: id,
    photo: photo
  )
end
def photos(conn, _params) do
  render(conn, :photos)
end

end
