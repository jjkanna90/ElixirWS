defmodule StateDemo do
  @moduledoc false


  def startReceiver do
  {:ok,pid}=Task.start_link(fn -> loop(%{}) end)
  Process.register(pid,:statemaintainer)
  end

  defp loop(map) do
    receive do
      {:get,key,caller} -> val = Map.get(map,key)
                           send(caller,{:ok,val})
                           loop(map)

       {:put,key,value} -> loop(Map.put(map,key,value));
    end
  end

end
