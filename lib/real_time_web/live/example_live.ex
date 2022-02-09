defmodule RealTimeWeb.ExampleLive do
  use Surface.LiveView

  alias RealTimeWeb.Components.ExampleComponent

  def render(assigns) do
    ~F"""
    <ExampleComponent>
      Hi there!
    </ExampleComponent>
    """
  end
end
