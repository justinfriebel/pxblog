defmodule Pxblog.Post do
  use Pxblog.Web, :model

  schema "posts" do
    field :title, :string
    field :body, :string
    belongs_to :user, Pxblog.User

    timestamps
  end

  @required_fields ~w(title body)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> strip_unsafe_body(params)
  end

  defp strip_unsafe_body(model, %{"body" => nil}) do
    model
  end

  # removed this so links and iframes are welcome,
  # should look more into how unsafe it is though
  #
  # defp strip_unsafe_body(model, %{"body" => body}) do
  #   {:safe, clean_body} = Phoenix.HTML.html_escape(body)
  #   model |> put_change(:body, clean_body)
  # end

  defp strip_unsafe_body(model, params) do
    model
  end
end
