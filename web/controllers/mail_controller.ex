defmodule MailEx.MailController do
  use MailEx.Web, :controller
  
  alias MailEx.{Mail, Mailer}

  def new(conn, _params) do
    changeset = Mail.changeset(%Mail{}, %{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"mail" => mail_params}) do
    mail_params
    |> Email.send_contact_email
    |> Mailer.deliver_later

    conn
    |> put_flash(:info, "Email sent!")
    |> redirect(to: mail_path(conn, :new))
  end
end
