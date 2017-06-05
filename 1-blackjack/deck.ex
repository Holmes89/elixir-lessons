defmodule Deck do

  @moduledoc """
    Standard card Deck
  """

  @doc """
    Returns a list of card tuples
  """
  def new_deck do
    for suit <- [:hearts, :clubs, :diamonds, :spades],
        face <- [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"],
        do: {suit, face}
  end

  def shuffle(deck \\ new_deck()) do
    Enum.shuffle(deck)
  end

end
