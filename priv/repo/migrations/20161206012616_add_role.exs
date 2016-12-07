defmodule PhoenixTemplate.Repo.Migrations.AddRole do
  use Ecto.Migration

  def up do
    # From http://stackoverflow.com/questions/36723407/how-to-run-updating-in-migration-for-ecto
    alter table(:users) do
      add :role, :integer, null: false
    end
  end

  def down do
    alter table(:users) do
      remove :role
    end
  end
end
