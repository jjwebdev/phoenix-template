defmodule PhoenixTemplate.Repo.Migrations.UpdateUserModel do
  use Ecto.Migration

  def up do
    # From http://stackoverflow.com/questions/36723407/how-to-run-updating-in-migration-for-ecto
    alter table(:users) do
      add :role, :integer
    end
    flush
    
    PhoenixTemplate.Repo.update_all("users", set: [role: 1])
    alter table(:users) do
      modify :email, :string, null: false
      modify :password_digest, :string, null: false
      modify :role, :integer, null: false
    end
    create unique_index :users, [:email]
  end

  def down do
    alter table(:users) do
      modify :email, :string, null: true
      modify :password_digest, :string, null: true
      remove :role
    end
  end
end
