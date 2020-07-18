defmodule Shopping.Registry.RegServer do
  @moduledoc false
  use GenServer
  #Using GenServer here is important if you want to supervise this module or process using supervisor
  # name -> processid registry

  def init(:ok) do
    {:ok,%{}}
  end

  def handle_call({:retrieve,name},_from,names) do
    {:reply, Map.get(names,name),names}
  end

  def handle_cast({:create,name},names) do
    if Map.has_key?(names,name) do
      {:noreply, names}
    else
      {:ok,bucketid} = Shopping.Bucket.BucketAgent.start_link(name)
      {:noreply, Map.put(names,name,bucketid)}
    end
  end


  # This method name is important as we have used GenServer and supervisor calls this method
  def start_link(opts) do
    GenServer.start_link(__MODULE__,:ok,opts)
  end

  def getBucket(registry, name) do
    GenServer.call(registry, {:retrieve,name})
  end

  def createBucket(registry, name) do
    GenServer.cast(registry, {:create,name})
    getBucket(registry, name)
  end

end
