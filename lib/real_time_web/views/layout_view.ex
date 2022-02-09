defmodule RealTimeWeb.LayoutView do
  use RealTimeWeb, :view
  def title() do
    "Undi Online"
  end

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}
end
