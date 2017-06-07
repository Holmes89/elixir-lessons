defmodule CardServer.Producer do
  use GenStage

  def start_link(initial \\ 0) do
    GenStage.start_link(__MODULE__, 0, name: __MODULE__)
  end

  def init(card) do
    {:producer, card}
  end

  def handle_demand(demand, state) do
    deck= CardServer.Deck.new_shuffled_deck(demand)
    events = tl deck
    card = hd deck
    {:noreply, events, card}
  end
end
