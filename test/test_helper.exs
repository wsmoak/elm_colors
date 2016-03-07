ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ElmColors.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ElmColors.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ElmColors.Repo)

