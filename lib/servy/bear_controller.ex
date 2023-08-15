defmodule Servy.BearController do
  alias Servy.Wildthings
  alias Servy.Bear

  defp bear_item(bear) do
    "<li>#{bear.name} - #{bear.type}</li>"
  end

  def index(conv) do
    items =
      Wildthings.list_bears()
      |> Enum.filter(&Bear.is_grizzly/1)
      |> Enum.sort(&Bear.order_asc_by_name/2)
      |> Enum.map(&bear_item/1)
      |> Enum.join("\n")
    # Transform bears to an HTML list. <ul><li>Name</li></ul>
    %{conv | status: 200, resp_body: "<ul>\n#{items}\n</ul>"}
  end

  def show_bear(conv, %{"id" => id}) do
    bear = Wildthings.get_bear(id)
    %{conv | status: 200, resp_body: "Bear #{bear.id}: #{bear.name}"}
  end

  def create(conv, %{"type" => type, "name" => name} = _params) do
    %{conv | status: 201, resp_body: "Created a #{type} bear named #{name}!"}
  end
end
