defmodule PhoenixTemplate.Repo do
  use Ecto.Repo, otp_app: :phoenix_template
  use Scrivener, page_size: 10
end
