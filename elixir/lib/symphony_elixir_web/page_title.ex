defmodule SymphonyElixirWeb.PageTitle do
  @moduledoc """
  Resolves the observability web page title.
  """

  @default_title "运营仪表盘"
  @title_env "SYMPHONY_WEB_TITLE"

  @spec title() :: String.t()
  def title do
    case System.get_env(@title_env) do
      value when is_binary(value) ->
        value
        |> String.trim()
        |> fallback_if_empty()

      _ ->
        @default_title
    end
  end

  defp fallback_if_empty(""), do: @default_title
  defp fallback_if_empty(value), do: value
end
