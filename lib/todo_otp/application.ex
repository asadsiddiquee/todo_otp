defmodule TodoOtp.Application do
  use Application

  @impl true
  def start(_type, _args) do
    TodoOtp.Supervisor.start_link([])
  end
end
