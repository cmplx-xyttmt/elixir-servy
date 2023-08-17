defmodule Comprehensions do
  @ranks [ "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A" ]
  @suits [ "♣", "♦", "♥", "♠" ]

  def cards() do
    for rank <- @ranks, suit <- @suits do
      {rank, suit}
    end
  end

  def deal_13() do
    deck = cards()
    shuffled_deck = Enum.shuffle(deck)
    Enum.slice(shuffled_deck, 0, 13)
  end

  def deal_13_4_hands() do
    deck = cards()
    shuffled_deck = Enum.shuffle(deck)
    for start <- 0..3 do
      Enum.slice(shuffled_deck, start * 13, 13)
    end
  end

  def deal_13_sol() do
    cards()
    |> Enum.shuffle
    |> Enum.take(13)
    |> IO.inspect
  end

  def deal_13_4_hands() do
    cards()
    |> Enum.shuffle
    |> Enum.chunk_every(13)
    |> IO.inspect
  end
end

cards = Comprehensions.cards()

IO.inspect(cards)

IO.inspect(Comprehensions.deal_13)

IO.inspect(Comprehensions.deal_13_4_hands)
