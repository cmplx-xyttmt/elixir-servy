defmodule Servy.Plugins do

  alias Servy.Conv
  require Logger

  def emojify(%Conv{status: 200, resp_body: resp_body} = conv) do
    %{conv | resp_body: "🎉🎉🎉\n #{resp_body}\n 🎉🎉🎉"}
  end

  def emojify(conv), do: conv

  def rewrite_query_params(%Conv{path: "/bears?id=" <> id} = conv) do
    %{conv | path: "/bears/#{id}"}
  end

  def rewrite_query_params(conv), do: conv

  def track(%Conv{status: 404, path: path} = conv) do
    Logger.info "Warning: #{path} is on the loose!\n\n"
    conv
  end

  def track(%Conv{} = conv), do: conv

  def rewrite_path(%Conv{path: "/wildlife"} = conv) do
    %{conv | path: "/wildthings"}
  end

  def rewrite_path(%Conv{} = conv), do: conv

  def log(conv), do: IO.inspect conv
end
