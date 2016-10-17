defmodule BlogPress.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias BlogPress.Repo
  alias BlogPress.AdminUser
  
  def for_token(admin_user = %AdminUser{}), do: { :ok, "AdminUser:#{admin_user.id}" }
  def for_token(_), do: { :error, "Unknown resource type" }
  
  def from_token("AdminUser:" <> id), do: { :ok, Repo.get(AdminUser, id) }
  def from_token(_), do: { :error, "Unknown resource type" }
end
