defmodule Shopping.Registry.RegServerMonitor do
  @moduledoc false
  use GenServer

  # name -> processid registry

  def init(:ok) do
    #Map bucketname --> bucket pid
    buckets = %{}
    #Map bucketpid --> monitor ref
    refs = %{}

    {:ok,{buckets,refs}}

  end

  def handle_call({:retrieve,name},_from,{buckets,refs}) do
    {:reply, Map.get(buckets,name),{buckets,refs}}
  end

  def handle_cast({:create,name},{buckets,refs}) do
    if Map.has_key?(buckets,name) do
      {:noreply, {buckets,refs}}
    else
      {:ok,bucketid} = Shopping.Bucket.BucketAgent.start_link(name)
      ref = Process.monitor(bucketid)
      IO.puts("Bucket #{name} created with bucketid and ref")
      IO.inspect(bucketid)
      IO.inspect(ref)
      {:noreply, {Map.put(buckets,name,bucketid),Map.put(refs,ref,name)}}
    end
  end

  #handle info callback to handle :DOWN message from bucket processes
  def handle_info({:DOWN, ref, :process, pid, flag},{buckets,refs}) do
    #Remove the bucket process from buckets and refs
    IO.puts("Stop call received by")
    IO.inspect(ref)
    {name,refs} = Map.pop(refs,ref)
    {_,buckets} = Map.pop(buckets,name)
    IO.puts("Removed bucket")
    {:noreply,{buckets,refs}}

  end

  #Catch all other messages from processes
  def handle_info(_all,state) do
    {:noreply,state}

  end


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
