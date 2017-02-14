defmodule Email do
  use Bamboo.Phoenix, view: MailEx.EmailView

  @defaults %{from: "no-replay@mailex.com"}

  def welcome_text_render_email(email_address) do
    new_email
    |> to(email_address)
    |> from(@defaults.from)
    |> subject("Welcome! render text")
    |> put_text_layout({MailEx.LayoutView, "email.text"})
    |> render("welcome.text")
  end

  def welcome_html_render_email(email_address) do
    new_email
    |> to(email_address)
    |> from(@defaults.from)
    |> subject("Welcome! render html")
    |> put_html_layout({MailEx.LayoutView, "email.html"})
    |> render("welcome.html")
  end

  def send_contact_email(%{"to" => to, "subject" => subject, "body" => body}) do
    new_email
    |> to(to)
    |> from(@defaults.from)
    |> subject(subject)
    |> put_html_layout({MailEx.LayoutView, "email.html"})
    |> render("contact.html", body: body)
  end
end
