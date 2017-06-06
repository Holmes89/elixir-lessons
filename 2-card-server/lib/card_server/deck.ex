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

  def new_deck(size) when size <= 52 do
      new_deck()
  end

  def new_deck(size) do
      new_deck(size-52)++new_deck()
  end

  def new_shuffled_deck do
      new_deck()
      |> Enum.shuffle
  end

  def new_shuffled_deck(size) do
      new_deck(size)
      |> Enum.shuffle
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

end
