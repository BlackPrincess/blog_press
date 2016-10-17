# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BlogPress.Repo.insert!(%BlogPress.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
BlogPress.Repo.insert!(BlogPress.AdminUser.changeset(%BlogPress.AdminUser{}, %{name: "admin", email: "admin@example.com", password: "admin@example.com"}))
