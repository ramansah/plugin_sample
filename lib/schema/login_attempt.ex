defmodule Mailchimp.Schema.LoginAttempt do

  use Ecto.Schema
  import Ecto.Changeset

  schema "mailchimp_login_attempts" do
    field(:email, :string)
    field(:is_successful, :boolean)

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:email, :is_successful])
    |> validate_required([:email, :is_successful])
  end
end
