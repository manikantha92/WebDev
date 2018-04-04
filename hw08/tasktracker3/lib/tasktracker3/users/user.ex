defmodule Tasktracker3.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    has_many :task, Tasktracker3.Tasks.Task, on_delete: :nilify_all, foreign_key: :user_id
    has_many :assigned_task, Tasktracker3.Tasks.Task, on_delete: :nilify_all, foreign_key: :assigned_to

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :name, :password, :password_confirmation])
    |> unique_constraint(:email)
    |> validate_confirmation(:password)
    |> validate_password(:password)
    |> put_pass_hash()
    |> validate_required([:email, :name, :password_hash])
  end

    def validate_password(changeset, field, options \\ []) do
      validate_change(changeset, field, fn _, password ->
        case valid_password?(password) do
          {:ok, _} -> []
          {:error, msg} -> [{field, options[:message] || msg}]
        end
      end)
    end

    def put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
      change(changeset, Comeonin.Argon2.add_hash(password))
    end
    def put_pass_hash(changeset), do: changeset

    def valid_password?(password) when byte_size(password) > 5 do
      {:ok, password}
    end
    def valid_password?(_), do: {:error, "You have left the password blank or it is too short!! Please enter a valid password"}
end

#Attribution: https://hexdocs.pm/comeonin/Comeonin.Bcrypt.html
