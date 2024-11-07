defmodule TodoOtp.TodoServer do
  use GenServer

  # Client API
  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def add_task(task) do
    GenServer.cast(__MODULE__, {:add_task, task})
  end

  def complete_task(task_id) do
    GenServer.cast(__MODULE__, {:complete_task, task_id})
  end

  def list_tasks do
    GenServer.call(__MODULE__, :list_tasks)
  end

  # Server Callbacks

  def init(_) do
    {:ok, %{tasks: %{}, next_id: 1}}
  end

  def handle_cast({:add_task, task}, %{tasks: tasks, next_id: id} = state) do
    new_tasks = Map.put(tasks, id, %{id: id, description: task, completed: false})
    {:noreply, %{state | tasks: new_tasks, next_id: id + 1}}
  end

  def handle_cast({:complete_task, task_id}, %{tasks: tasks} = state) do
    new_tasks =
      Map.update(tasks, task_id, nil, fn task ->
        %{task | completed: true}
      end)

    {:noreply, %{state | tasks: new_tasks}}
  end

  def handle_call(:list_tasks, _from, %{tasks: tasks} = state) do
    {:reply, Map.values(tasks), state}
  end
end
