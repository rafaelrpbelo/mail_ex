defmodule MailEx.MailController do
  use MailEx.Web, :controller
  
  alias MailEx.{Mail, Mailer, SwooshMailer, UserEmail}

  def new(conn, _params) do
    changeset = Mail.changeset(%Mail{}, %{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"mail" => mail_params}) do
    # Send email with Bamboo
    #mail_params
    #|> Email.send_contact_email
    #|> Mailer.deliver_later

    # Send email with Swoosh
    Task.async fn ->
      mail_params
      |> UserEmail.send_email
      |> SwooshMailer.deliver
    end

    conn
    |> put_flash(:info, "Email sent!")
    |> redirect(to: mail_path(conn, :new))
  end
end
