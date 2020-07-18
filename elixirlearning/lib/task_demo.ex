defmodule TaskDemo do
  @moduledoc false


  def mytaskdemo() do
        {:ok,pid} = Task.start(fn -> IO.puts("Wheeee i started") end)
        IO.puts("Task created and started with #{inspect(pid)}")
  end



end
