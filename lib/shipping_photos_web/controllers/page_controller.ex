
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
  photos = [
    "Front.jpg",
    "Side.jpg",
    "Back.jpg"
  ]

  render(conn, :job,
    id: id,
    photos: photos
  )
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


# The `find_job` function is responsible for handling the form submission from the job search page.
# It takes the job number entered by the user, constructs a URL for the job details page, and redirects the user to that page.
#
# JoeD  11/11/2026

def job_search(conn, _params) do
  render(conn, :job_search)
end


def find_job(conn, %{"job_number" => job_number}) do
  redirect(conn, to: "/job/#{job_number}")
end


end
