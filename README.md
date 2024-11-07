# TodoOtp

**TODO: App uses Elixir's OTP **

# how to run
git Clone > install erlang > install elixir

To run the application, start an IEx session in terminal
with the application:
```bash
iex -S mix
```

Then start the CLI:
```elixir
TodoOtp.CLI.main()
```

# how to use

You can use it like this:
```
--- Todo App Menu ---
1. Add Task
2. List Tasks
3. Complete Task
4. Exit

Choose an option: 1
Enter task description:
Buy groceries
Task added successfully!

--- Todo App Menu ---
1. Add Task
2. List Tasks
3. Complete Task
4. Exit

Choose an option: 2
Current Tasks:
[ ] 1. Buy groceries

--- Todo App Menu ---
1. Add Task
2. List Tasks
3. Complete Task
4. Exit

Choose an option: 3
Enter task ID to complete:
1
Task marked as completed!

--- Todo App Menu ---
1. Add Task
2. List Tasks
3. Complete Task
4. Exit

Choose an option: 2
Current Tasks:
[✓] 1. Buy groceries
```
