defmodule Servy.BearController do
  alias Servy.Wildthings
  alias Servy.Bear
  import Servy.View, only: [render: 3]

  # defp bear_item(bear) do
  #   "<li>#{bear.name} - #{bear.type}</li>"
  # end

  def index(conv) do
    bears =
      Wildthings.list_bears()
      |> Enum.sort(&Bear.order_asc_by_name/2)

    render("index.eex", conv, [bears: bears])
  end

  def show_bear(conv, %{"id" => id}) do
    bear = Wildthings.get_bear(id)

    render("show.eex", conv, [bear: bear])
  end

  def create(conv, %{"type" => type, "name" => name} = _params) do
    %{conv | status: 201, resp_body: "Created a #{type} bear named #{name}!"}
  end

  def delete(conv) do
     %{ conv | status: 403, resp_body: "Deleting a bear is forbidden."}
  end
end
