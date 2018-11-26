defmodule Mailchimp do

  alias Mailchimp.Schema.LoginAttempt

  def run(%{ request_path: "/session",
              method: "POST",
              params: params,
              status: 302,
              resp_headers: resp_headers } = conn, repo) do
    %{ "session" => %{ "email" => email } } = params
    conn
    |> Plug.Conn.get_resp_header("location")
    |> handle_login(email, repo)
    conn
  end

  def run(conn, _), do: conn

  # Private

  # Failed login attempt

  def handle_login(["/session/new"], email, repo) do
    insert_record(email, false, repo)
  end

  # Successful login attempt

  def handle_login(_, email, repo) do
    insert_record(email, true, repo)
  end

  def insert_record(email, is_successful, repo) do
    %{email: email, is_successful: is_successful}
    |> LoginAttempt.changeset()
    |> repo.insert()
  end

end
