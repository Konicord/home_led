defmodule HomeLed.LedController do
  use GenServer

  alias Circuits.GPIO

  def init(_opts) do
    send(self(), :blink)
    {:ok, opts}
  end

  def handle_info(:blink, state) do
    Process.send_after(self(), :blink, 3000)
    blink_led()

    {:noreply, state}
  end

  defp blink_led() do
    {:ok, gpio} = GPIO.open(18, :output)
    GPIO.write(gpio, 1)
    :timer.sleep(200)
    GPIO.write(gpio, 0)
    GPIO.close(gpio)
  end

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end
end
