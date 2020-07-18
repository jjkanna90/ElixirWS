defmodule Shopping.Bucket.BucketServer do
  @moduledoc false
  use GenServer


  #Server
  def init(firstMap) do
    {:ok,firstMap}
  end

  def handle_call({:get,itemname}, _from, map) do
   # IO.puts(Map.get(map,itemname))
    {:reply,Map.get(map,itemname),map}
  end

  def handle_call({:remove,itemname},_from, map) do
      {value,newmap} = Map.pop(map,itemname)
     {:reply,value,newmap}
  end

  def handle_cast({:put, itemname, value},map) do
    {:noreply, Map.put(map,itemname,value)}
  end


  #client

  def start_link(opts) do
    GenServer.start_link(__MODULE__, %{})
  end

  def addItem(bucketname, itemname, value) do
    GenServer.cast(bucketname, {:put,itemname, value})
  end

  def getItem(bucketname, itemname) do
    GenServer.call(bucketname, {:get,itemname})
  end

  def deleteItem(bucketname, itemname) do
    GenServer.call(bucketname, {:remove,itemname})
  end

end
