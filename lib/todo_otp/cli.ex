defmodule TodoOtp.CLI do
  def main do
    loop()
  end

  defp loop do
    display_menu()
    handle_choice(IO.gets("Choose an option: ") |> String.trim())
    loop()
  end

  defp display_menu do
    IO.puts("\n--- Todo App Menu ---")
    IO.puts("1. Add Task")
    IO.puts("2. List Tasks")
    IO.puts("3. Complete Task")
    IO.puts("4. Exit")
  end

  defp handle_choice("1") do
    IO.puts("\nEnter task description:")
    task = IO.gets("") |> String.trim()
    TodoOtp.TodoServer.add_task(task)
    IO.puts("Task added successfully!")
  end

  defp handle_choice("2") do
    IO.puts("\nCurrent Tasks:")

    TodoOtp.TodoServer.list_tasks()
    |> Enum.each(fn task ->
      status = if task.completed, do: "✓", else: " "
      IO.puts("[#{status}] #{task.id}. #{task.description}")
    end)
  end

  defp handle_choice("3") do
    IO.puts("\nEnter task ID to complete:")
    task_id = IO.gets("") |> String.trim() |> String.to_integer()
    TodoOtp.TodoServer.complete_task(task_id)
    IO.puts("Task marked as completed!")
  end

  defp handle_choice("4") do
    IO.puts("\nGoodbye!")
    System.halt(0)
  end

  defp handle_choice(_) do
    IO.puts("\nInvalid choice. Please try again.")
  end
end
