defmodule ShippingPhotos.Repo do
  use Ecto.Repo,
    otp_app: :shipping_photos,
    adapter: Ecto.Adapters.Postgres
end
