defmodule Shopping.Registry.RegServerMonitorTest do
  @moduledoc false
  use ExUnit.Case, async: false

  alias Shopping.Registry.RegServerMonitor
  alias Shopping.Bucket.BucketAgent

  setup do
    regserverid = start_supervised!(Shopping.Registry.RegServerMonitor)
    %{:registry => regserverid}
  end

  test "creating a new bucket and retrieving it from registry",  %{:registry => regserverid} do
    bucketid = RegServerMonitor.createBucket(regserverid,"shopping")
    assert bucketid != nil
  end

  test "retrieving a bucket and adding stuff to it",  %{:registry => regserverid} do
    bucketid = RegServerMonitor.createBucket(regserverid,"shopping2")
    BucketAgent.addItem(bucketid,"Milk",1)
    assert BucketAgent.getItem(bucketid,"Milk") == 1
  end


  test "removing a bucket if it stopped",  %{:registry => regserverid} do

    bucketid = RegServerMonitor.createBucket(regserverid,"shopping3")
    Agent.stop(bucketid)
    Process.sleep(1000)
    assert RegServerMonitor.getBucket(regserverid,"shopping3") == nil

  end

end
