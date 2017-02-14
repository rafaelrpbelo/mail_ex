defmodule MailEx.UserEmail do
  use Phoenix.Swoosh, view: MailEx.UserEmailView, layout: {MailEx.LayoutView, :email}

  def send_email(%{"to" => email, "subject" => subject, "body" => body}) do
    new
    |> to(email)
    |> from({"Mr. Walter", "walter@mail.com"})
    |> subject("Welcome to our team!")
    |> html_body("<h1>#{body}</h1>")
    |> render_body("main.html")
  end
end
