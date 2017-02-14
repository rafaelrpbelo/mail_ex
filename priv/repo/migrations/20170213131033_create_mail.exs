defmodule MailEx.Repo.Migrations.CreateMail do
  use Ecto.Migration

  def up do
    create table(:mails) do
      add :to, :string
      add :subject, :string
      add :body, :string

      timestamps()
    end
  end

  def down do
    drop table(:mails)
  end
end
