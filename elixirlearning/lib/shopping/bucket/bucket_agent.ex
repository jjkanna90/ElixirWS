defmodule Shopping.Bucket.BucketAgent do
  @moduledoc false
  use Agent
  # Using agent is important as the Supervisor will be used to supervise this module. Just think of it like inheritance in Java.
  # using Agent will make BucketAgent module into an Agent

  # The moethod name is important as the supervisor will be calling this method to start the Agent.
  def start_link(_ops) do
    Agent.start_link(fn -> %{} end)
  end

  def addItem(agentname, key, value) do

    Agent.update(agentname, fn mymap -> Map.put(mymap,key,value)
            end)
  end

  def getItem(agentname, key) do
    Agent.get(agentname, fn mymap -> Map.get(mymap, key) end)
  end

  def deleteItem(agentname, key) do
    Agent.get_and_update(agentname, fn mymap -> Map.pop(mymap,key) end)
  end


end
