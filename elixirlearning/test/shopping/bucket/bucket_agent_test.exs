defmodule Shopping.Bucket.BucketAgentTest do



  @moduledoc false
  use ExUnit.Case
  alias Shopping.Bucket.BucketAgent


  setup do

    {:ok,bucket} = BucketAgent.start_link(:mybucket)
    %{:bucket => bucket}
  end

  test "test insert and retrieval", %{:bucket => bucket} do

    BucketAgent.addItem(bucket,:test,"myval")
    assert BucketAgent.getItem(bucket,:test) == "myval"

  end


  test "test get and delete", %{:bucket => bucket} do

    BucketAgent.addItem(bucket,:test2,"myval2")
    assert BucketAgent.getItem(bucket,:test2) == "myval2"
    deletedItem = BucketAgent.deleteItem(bucket,:test2)
    assert deletedItem == "myval2"
    assert BucketAgent.getItem(bucket,:test2) == nil

  end




end
