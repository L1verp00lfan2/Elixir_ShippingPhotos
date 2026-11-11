defmodule ShippingPhotosWeb.Router do
  use ShippingPhotosWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ShippingPhotosWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end


  # These are the routes for the main pages of the application, including the home page, about page, and job details page.
  # The `PageController` handles the logic for rendering these pages.

  scope "/", ShippingPhotosWeb do
  pipe_through :browser

  get "/", PageController, :home
   get "/home", PageController, :home

  get "/about", PageController, :about
  get "/job/:id", PageController, :job

  get "/job/:id/photo/:photo", PageController, :photo
  get "/photos", PageController, :photos


  #adding functionality to search for jobs by their ID. This route will handle GET requests to the /search/:id URL, where :id is a dynamic parameter representing the job ID. The request will be routed to the search action in the PageController, which will handle the logic for searching and displaying the job details based on the provided ID.

  get "/job_search", PageController, :job_search
  post "/job_search", PageController, :find_job

# The `image` route is responsible for serving image files from the server.
# It takes a dynamic parameter `:filename`, which represents the name of the image file to be served.
# The request will be routed to the `image` action in the `PageController`, which will handle the logic for
# retrieving and sending the requested image file to the client.


  get "/image/:filename", PageController, :image
end


  # Other scopes may use custom stacks.
  # scope "/api", ShippingPhotosWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:shipping_photos, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ShippingPhotosWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
