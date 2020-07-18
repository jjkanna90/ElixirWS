defmodule Shopping.Registry.RegServerTest do
  @moduledoc false
  use ExUnit.Case, async: false

  alias Shopping.Registry.RegServer
  alias Shopping.Bucket.BucketAgent

  setup do
    regserverid = start_supervised!(Shopping.Registry.RegServer)
    %{:registry => regserverid}
  end

  test "creating a new bucket and retrieving it from registry",  %{:registry => regserverid} do
    bucketid = Shopping.Registry.RegServer.createBucket(regserverid,"shopping")
    assert bucketid != nil
  end

  test "retrieving a bucket and adding stuff to it",  %{:registry => regserverid} do
    bucketid = Shopping.Registry.RegServer.createBucket(regserverid,"shopping2")
    BucketAgent.addItem(bucketid,"Milk",1)
    assert BucketAgent.getItem(bucketid,"Milk") == 1
  end

end
