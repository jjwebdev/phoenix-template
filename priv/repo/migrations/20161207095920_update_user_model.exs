defmodule PhoenixTemplate.Repo.Migrations.UpdateUserModel do
  use Ecto.Migration

  def up do
    # From http://stackoverflow.com/questions/36723407/how-to-run-updating-in-migration-for-ecto
    alter table(:users) do
      modify :email, :string, null: false
      modify :password_digest, :string, null: false
    end
    # create unique_index :users, [:email]
  end

  def down do
    alter table(:users) do
      modify :email, :string, null: true
      modify :password_digest, :string, null: true
    end
  end
end
