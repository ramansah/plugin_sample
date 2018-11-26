defmodule MailchimpWeb.DashboardController do

  import Plug.Conn
  alias Mailchimp.Schema.LoginAttempt

  def index(conn, params, repo) do
    data = %{
      attempts: repo.all(LoginAttempt)
    }
    assign(
      conn,
      :mailchimp_data,
      data
    )
  end

end
