defmodule Snitch.Repo.Migrations.Mailchimp do
  use Ecto.Migration

  def change do

    create table("mailchimp_login_attempts") do
      add :email, :string, size: 40
      add :is_successful, :boolean
      timestamps()
    end

  end
end
