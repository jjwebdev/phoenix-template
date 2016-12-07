defmodule PhoenixTemplate.UserResolver do
  alias PhoenixTemplate.Repo
  alias PhoenixTemplate.User

  def all(_args, _info) do
    {:ok, Repo.all(User)}
  end
end
