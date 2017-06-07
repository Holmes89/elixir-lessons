defmodule CardServer do
  use Application

  alias CardServer.{Producer, Consumer}

  def start(_type, _args) do
  import Supervisor.Spec, warn: false

  children = [
    worker(Producer, [0]),
    worker(Consumer, [], id: 1),
    worker(Consumer, [], id: 2)
  ]

  opts = [strategy: :one_for_one, name: CardServer.Supervisor]
  Supervisor.start_link(children, opts)
end

  def notify_producer do
    send(Producer, :data_inserted)
  end

  defdelegate enqueue(module, function, args), to: Producer
end
