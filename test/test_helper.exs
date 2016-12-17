ExUnit.start

Ecto.Adapters.SQL.Sandbox.mode(PhoenixTemplate.Repo, :manual)
{:ok, _} = Application.ensure_all_started(:wallaby)
Application.put_env(:wallaby, :base_url, PhoenixTemplate.Endpoint.url)
Application.put_env(:wallaby, :screenshot_on_failure, true)
