defmodule MailEx.Mail do
  use MailEx.Web, :model

  @required_fields [:to, :body]
  @optional_fields [:subject]

  schema "mails" do
    field :to, :string
    field :subject, :string
    field :body, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
