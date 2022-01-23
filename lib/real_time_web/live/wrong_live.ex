defmodule RealTimeWeb.WrongLive do
  use RealTimeWeb, :live_view
  def mount(_param, _session, socket) do
    {:ok,
     assign(
       socket,
       score: 0,
       message: "Guess a number",
       answer: answer()
     )}
  end
  defp answer() do
    :rand.uniform(10)
  end
  def render(assigns) do
    ~H"""
    <h1 class="text-6xl">Your score: <span class="text-red-800"><%= @score %></span></h1>
    <h2 class="text-center text-4xl font-semibold mb-8 text-indigo-700 mt-5">
    <%= @message %>
    </h2>
    <h2 class="text-center italic hover:not-italic text-2xl mb-8">
    <%= for n <- 1..10 do %>
    <a href="#" phx-click = "guess" phx-value-number = {n}><%= n %></a>
    <% end %>
    </h2>
    """
  end

  def handle_event("guess", %{"number"=> guess}, socket) do
    if guess == "#{socket.assigns.answer}" do
      {:noreply,
       assign(
         socket,
         score: socket.assigns.score + 10,
         message: "Your guess #{guess} Correct! Plus 10 points. Another Go",
         answer: answer()
       )}
    else
      {:noreply,
       assign(
         socket,
         score: socket.assigns.score - 1,
         message: "Your guess #{guess} Wrong!! Minus a point. Try again",
         answer: answer()
       )}
    end
  end
end
